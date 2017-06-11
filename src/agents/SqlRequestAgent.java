package agents;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.mysql.jdbc.ResultSetMetaData;

import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.core.behaviours.OneShotBehaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;

public class SqlRequestAgent  extends Agent{
	/*
	 * The agent who receives the SQL request from others agents
	 * and response with results
	 * */
	protected void setup(){
		this.addBehaviour(new ReceiveBehaviour());
	}
	
	protected class ReceiveBehaviour extends Behaviour{
		@Override
		public void action() {
			ACLMessage msg = receive();
			if(msg != null){
				if(msg.getPerformative() == ACLMessage.REQUEST){
					addBehaviour(new SqlBehaviour(msg));
				}
				else{
					addBehaviour(new SelectSqlBehaviour(msg));
				}
			}
			else
				block();
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
	
	protected class SqlBehaviour extends OneShotBehaviour{
		ACLMessage msgReceived;
		public SqlBehaviour(ACLMessage msgReceived) {
			this.msgReceived = msgReceived;
		}
		@Override
		public void action() {
			String sqlRequest = encodeFromPage(msgReceived.getContent());
			ACLMessage reply = msgReceived.createReply();
			Connection cnx=null;
			try {
				cnx = sql.util.ConnexionBDD.getInstance().getCnx();
				cnx.setAutoCommit(false);
				for(String s : sqlRequest.split(";")){
					PreparedStatement ps = cnx.prepareStatement(s);
					ps.execute();
				}
				cnx.commit();
				sql.util.ConnexionBDD.getInstance().closeCnx();
				reply.setContent(Constants.Message.SUCCESS_MODIFY_DATABASE);
				reply.setPerformative(ACLMessage.INFORM);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
				try {
					cnx.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				reply.setContent(Constants.Message.ERROR_WITH_DATABASE);
				reply.setPerformative(ACLMessage.FAILURE);
			}
			send(reply);
		}
	}
	protected class SelectSqlBehaviour extends OneShotBehaviour{
		ACLMessage msgReceived;
		public SelectSqlBehaviour(ACLMessage msgReceived) {
			this.msgReceived = msgReceived;
		}

		@Override
		public void action() {
			ACLMessage reply = msgReceived.createReply();
			reply.setPerformative(ACLMessage.INFORM);
			String sqlRequest = encodeFromPage(msgReceived.getContent());
			String jsonResult = "";
			Connection cnx=null;
			try {
				cnx = sql.util.ConnexionBDD.getInstance().getCnx();
				cnx.setAutoCommit(true);
				PreparedStatement ps = cnx.prepareStatement(sqlRequest);
				ResultSet resultSet = ps.executeQuery();
				ResultSetMetaData metaData = (ResultSetMetaData) resultSet.getMetaData();
				int count = metaData.getColumnCount(); //number of column
				while(resultSet.next()){
					Map<String, String> map = new HashMap<String, String>();
					for(int i = 1; i <= count; i++){
						String columnName = metaData.getColumnLabel(i); //get the column's name
						map.put(columnName, resultSet.getString(columnName));
					}
					jsonResult = jsonResult + JsonHelper.serilisation(map) + ",";
				}
				if(!jsonResult.equals("")){
					jsonResult = "[" + jsonResult;
					jsonResult = jsonResult.substring(0, jsonResult.length()-1); //delete the last ","
					jsonResult += "]"; 
				}
				resultSet.close();
				sql.util.ConnexionBDD.getInstance().closeCnx();			
			} catch (SQLException e) {
				e.printStackTrace();
				reply.setContent(Constants.Message.ERROR_WITH_DATABASE);
				reply.setPerformative(ACLMessage.FAILURE);
			}
			reply.setContent(jsonResult);
			send(reply);
		}	
	}

	protected String encodeFromPage(String s){
		byte[] bytes;
		try {
			bytes = s.getBytes("ISO-8859-1");
			s = new String(bytes, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return s;
	}
}

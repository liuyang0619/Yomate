package agents;

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
			String sqlRequest = msgReceived.getContent();
			ACLMessage reply = msgReceived.createReply();
			reply.setPerformative(ACLMessage.INFORM);
			Connection cnx=null;
			try {
				cnx = sql.util.ConnexionBDD.getInstance().getCnx();
				PreparedStatement ps = cnx.prepareStatement(sqlRequest);
				ps.execute();
				sql.util.ConnexionBDD.getInstance().closeCnx();			
			} catch (SQLException e) {
				e.printStackTrace();
				reply.setContent("Erreur: something wrong with the database");
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
			String sqlRequest = msgReceived.getContent();
			String jsonResult = "";
			Connection cnx=null;
			try {
				cnx = sql.util.ConnexionBDD.getInstance().getCnx();
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
			}
			reply.setContent(jsonResult);
			send(reply);
		}	
	}
}

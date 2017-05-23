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
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import json.util.JsonHelper;

public class SqlRequestAgent  extends Agent{
	/*
	 * The agent who receives the SQL request from others agents
	 * and response with results
	 * */
	protected void setup(){
		this.addBehaviour(new ReceiveSqlBehaviour());
		this.addBehaviour(new ReceiveSelectSqlBehaviour());
	}
	
	protected class ReceiveSqlBehaviour extends Behaviour{
		@Override
		public void action() {
			MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.REQUEST); 
			ACLMessage msg = receive(mt);
			if(msg != null){
				String sqlRequest = msg.getContent();
				ACLMessage reply = msg.createReply();
				reply.setPerformative(ACLMessage.INFORM);
				Connection cnx=null;
				try {
					cnx = sql.util.ConnexionBDD.getInstance().getCnx();
					PreparedStatement ps = cnx.prepareStatement(sqlRequest);
					ps.execute();
					sql.util.ConnexionBDD.getInstance().closeCnx();			
				} catch (SQLException e) {
					e.printStackTrace();
					reply.setPerformative(ACLMessage.FAILURE);
				}
				send(reply);
			}
			else
				block();
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
	protected class ReceiveSelectSqlBehaviour extends Behaviour{
		@Override
		public void action() {
			MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.QUERY_REF); 
			ACLMessage msg = receive(mt);
			if(msg != null){
				ACLMessage reply = msg.createReply();
				reply.setPerformative(ACLMessage.INFORM_REF);
				String sqlRequest = msg.getContent();
				String jsonResult = "";
				Connection cnx=null;
				try {
					cnx = sql.util.ConnexionBDD.getInstance().getCnx();
					PreparedStatement ps = cnx.prepareStatement(sqlRequest);
					ResultSet resultSet = ps.executeQuery();
					ResultSetMetaData metaData = (ResultSetMetaData) resultSet.getMetaData();
					int count = metaData.getColumnCount(); //number of column
					jsonResult = "[";
					while(resultSet.next()){
						Map<String, String> map = new HashMap<String, String>();
						for(int i = 1; i <= count; i++){
							String columnName = metaData.getColumnLabel(i); //get the column's name
							map.put(columnName, resultSet.getString(columnName));
						}
						jsonResult = jsonResult + JsonHelper.serilisation(map) + ",";
					}
					jsonResult = jsonResult.substring(0, jsonResult.length()-1); //delete the last ","
					jsonResult += "]"; 
					resultSet.close();
					sql.util.ConnexionBDD.getInstance().closeCnx();			
				} catch (SQLException e) {
					e.printStackTrace();
				}
				reply.setContent(jsonResult);
				send(reply);
			}
			else
				block();
		}

		@Override
		public boolean done() {
			return false;
		}
		
	}
}

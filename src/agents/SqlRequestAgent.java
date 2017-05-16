package agents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jade.core.Agent;
import jade.core.behaviours.Behaviour;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;

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
				Connection cnx=null;
				try {
					cnx = sql.util.ConnexionBDD.getInstance().getCnx();
					PreparedStatement ps = cnx.prepareStatement(sqlRequest);
					ps.execute();
					sql.util.ConnexionBDD.getInstance().closeCnx();			
				} catch (SQLException e) {
					e.printStackTrace();
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
	protected class ReceiveSelectSqlBehaviour extends Behaviour{
		@Override
		public void action() {
			MessageTemplate mt = MessageTemplate.MatchPerformative(ACLMessage.QUERY_REF); 
			ACLMessage msg = receive(mt);
			if(msg != null){
				String sqlRequest = msg.getContent();
				Connection cnx=null;
				try {
					cnx = sql.util.ConnexionBDD.getInstance().getCnx();
					PreparedStatement ps = cnx.prepareStatement(sqlRequest);
					ResultSet res = ps.executeQuery();
					while(res.next()){
						System.out.println(res.getString("nom")+res.getInt("age")
						+res.getString("prof"));
					}
					
					res.close();
					sql.util.ConnexionBDD.getInstance().closeCnx();			
				} catch (SQLException e) {
					e.printStackTrace();
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
}

package agents;

import java.util.Map;

public class ActionMessageContent {
	String action;
	Map<String, String> params;
	ActionMessageContent() {
	}
	public ActionMessageContent(String action, Map<String, String> params) {
		this.action = action;
		this.params = params;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Map<String, String> getParams() {
		return params;
	}
	public void setParams(Map<String, String> params) {
		this.params = params;
	}
}

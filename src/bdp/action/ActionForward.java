package bdp.action;

public class ActionForward {
	private boolean isForward;
	private String nextURL;
	
	public ActionForward(boolean isForward, String nextURL) {
		super();
		this.isForward = isForward;
		this.nextURL = nextURL;
	}
	
	public ActionForward() {
		// null
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BDProject  [isForward=");
		builder.append(isForward);
		builder.append(", nextURL=");
		builder.append(nextURL);
		builder.append("]");
		return builder.toString();
	}

	public boolean isForward() {
		return isForward;
	}
	public void setForward(boolean isForward) {
		this.isForward = isForward;
	}
	public String getNextURL() {
		return nextURL;
	}
	public void setNextURL(String nextURL) {
		this.nextURL = nextURL;
	}
	
}// end of class YSNActionForward

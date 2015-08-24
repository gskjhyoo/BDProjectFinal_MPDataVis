package bdp.model.dto;

public class SidoSpecifiCountDTO {
	String guName;
	int countTotal;
	
	public SidoSpecifiCountDTO(String guName, int countTotal) {
		this.guName = guName;
		this.countTotal = countTotal;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SidoSpecifiCountDTO [guName=");
		builder.append(guName);
		builder.append(", countTotal=");
		builder.append(countTotal);
		builder.append("]");
		return builder.toString();
	}
	public String getGuName() {
		return guName;
	}
	public void setGuName(String guName) {
		this.guName = guName;
	}
	public int getCountTotal() {
		return countTotal;
	}
	public void setCountTotal(int countTotal) {
		this.countTotal = countTotal;
	}
	
	
}// end of class

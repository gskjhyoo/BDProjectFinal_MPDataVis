package bdp.model.dto;

public class SidoSpecifiCountDTO {
	
	String sggName;
	Long countTotal;
	
	public SidoSpecifiCountDTO(String sggName, Long countTotal) {
		this.sggName = sggName;
		this.countTotal = countTotal;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SidoSpecifiCountDTO [sggName=");
		builder.append(sggName);
		builder.append(", countTotal=");
		builder.append(countTotal);
		builder.append("]");
		return builder.toString();
	}

	public String getSggName() {
		return sggName;
	}
	public void setSggName(String sggName) {
		this.sggName = sggName;
	}
	public long getCountTotal() {
		return countTotal;
	}
	public void setCountTotal(Long countTotal) {
		this.countTotal = countTotal;
	}
	
}// end of class

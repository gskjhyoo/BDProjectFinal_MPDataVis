package bdp.util;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class UtilTime {
	static SimpleDateFormat SDFyyyyMMdd;
	static SimpleDateFormat SDFyyyyMMdd_HHmmss;
	static SimpleDateFormat SDFHHmmss;
	
	static {
		SDFyyyyMMdd = new SimpleDateFormat("yyyy-MM-dd");
		SDFyyyyMMdd_HHmmss = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SDFHHmmss = new  SimpleDateFormat("HH:mm:ss");
	}
	
	public static Date getDateFrom(String _stryyyy_MM_dd) throws ParseException{
		return new Date(SDFyyyyMMdd.parse(_stryyyy_MM_dd).getTime());
	}
	
	public static Timestamp getTimeStampFrom(String _stryyyy_MM_dd__HH$mm$ss) throws ParseException{
		return new Timestamp(SDFyyyyMMdd_HHmmss.parse(_stryyyy_MM_dd__HH$mm$ss).getTime());
	}
	
	public static Time getTimeFrom(String _strHHmmss) throws ParseException{
		return new Time(SDFHHmmss.parse(_strHHmmss).getTime());
	}
	
}// end of class

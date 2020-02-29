package com.oj.util;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String formatDate(Date date,String format){
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		if(date!=null){
			result=sdf.format(date);
		}
		return result;
	}
	
	
	public static Date formatString(String str,String format) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.parse(str);
	}
	
	public static Date strToDate(String strDate) {  
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
	    ParsePosition pos = new ParsePosition(0);  
	    Date strtodate = formatter.parse(strDate, pos);  
	    return strtodate;  
	}  
	
}

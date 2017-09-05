package techie.calendar;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class HtmlCalendar
{

  
    private static String NEWLINE = "\n";
    public static final int MONDAY_FIRST = 1;
    public static final int SUNDAY_FIRST = 2;
	boolean sunDay=false;
    private Hashtable cnf;
    private static final String Mnth[] = {
        "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", 
        "November", "December"
    };
    private int year;
    private int month;
    private int style;
    private String sFont;
    private Locale loc;
	private String bgColor="";

	
	public HtmlCalendar()
    {
        sFont = "";
		
        GregorianCalendar gregoriancalendar = new GregorianCalendar();
        cnf = new Hashtable();
        NEWLINE = System.getProperty("line.separator");
        style = 2;
        month = gregoriancalendar.get(2);
        year = gregoriancalendar.get(1);
        loc = Locale.US;
    }

    private String formatObject(String s, Object obj)
    {
        String s1 = "";
        if(obj != null)
            s1 = String.valueOf(String.valueOf(obj));
        if(s == null)
            return s1;
        else
            return s + s1 ;
    }

    private int getDay(Calendar calendar)
    {
        if(style == 2)
            return calendar.get(7) - 1;
        else
            return (calendar.get(7) + 5) % 7;
    }

    public String getHtml()
    {
        GregorianCalendar gregoriancalendar = new GregorianCalendar(year, month - 1, 1);
        GregorianCalendar gregoriancalendar1 = new GregorianCalendar(2001, 0, 14);
        SimpleDateFormat simpledateformat = new SimpleDateFormat("EEE", loc);
        int i = month - 1;
        int j = 0;
        StringBuffer stringbuffer = new StringBuffer("");
		stringbuffer.append("<font face=Arial color=#FF0000>");
        stringbuffer.append("<table border=0 style=\"font-family: Arial; font-size: 10pt\" width=\"100%\" align=\"center\"><tr><th colspan=7 align=center  bgcolor=\"#F8F8F8\">");
		stringbuffer.append("<font face=Arial size=2 color=#FF0000>"+gregoriancalendar.get(1)+"-"+Mnth[gregoriancalendar.get(2)]+"</font>");
		stringbuffer.append("</th></tr><tr>\n");
        if(style == 2)
        {
			stringbuffer.append("<td align=center bgcolor=\"#AAC1CE\"><font face=Arial size=2 ><b>" + formatObject(sFont, simpledateformat.format(gregoriancalendar1.getTime())) + "</b></font></td>\n");
            gregoriancalendar1.add(5, 1);
            for(int k = 1; k < 7; k++)
            {
				stringbuffer.append("<td align=center bgcolor=\"#AAC1CE\"><font face=Arial size=2><b>" + formatObject(sFont, simpledateformat.format(gregoriancalendar1.getTime())) + "</b></font></td>\n");
                gregoriancalendar1.add(5, 1);
            }

        } else
        {
            gregoriancalendar1.add(5, 1);
            stringbuffer.append("<td align=center bgcolor=\"#AAC1CE\"><font face=Arial size=2><b>" + formatObject(sFont, simpledateformat.format(gregoriancalendar1.getTime())) + "</b></font></td>\n");
            for(int l = 2; l < 8; l++)
            {
                gregoriancalendar1.add(5, 1);
                stringbuffer.append("<td align=center bgcolor=\"#AAC1CE\"><font face=Arial size=2><b>" + formatObject(sFont, simpledateformat.format(gregoriancalendar1.getTime())) + "</b></font></td>\n");
            }

        }
        stringbuffer.append("</tr>\n");
        int i1 = 0;
        j = 0;
        if(getDay(gregoriancalendar) > 0)
        {
            stringbuffer.append("<tr>");
            for(; i1 < getDay(gregoriancalendar); i1++)
            {
               
				stringbuffer.append("<td align=center bgcolor=\"#F8F8F8\">");
				
				if(sFont != null)
                    stringbuffer.append(sFont + "&nbsp;");
				
                else
                    stringbuffer.append("&nbsp;");
                stringbuffer.append("</td>\n");
                j++;
            }

        }
        for(; gregoriancalendar.get(2) == i; gregoriancalendar.add(5, 1))
        {
            int j1 = gregoriancalendar.get(5);
            int k1 = (i1 + j1) % 7;
            if(k1 == 1)
            {
                stringbuffer.append("<tr>" + NEWLINE);
                j = 0;
            }
        
			
			if(j %7 == 0){
            
			bgColor="#F8F8F8";
			sunDay =true;
			}else{
			bgColor="#F8F8F8";
			}
            String s;
			if((s = (String)cnf.get(String.valueOf(j1))) != null){
			bgColor="#00CCFF";
            }
			stringbuffer.append("<td align=center bgcolor="+bgColor+">");
            j++;
            if(sFont != null)
                stringbuffer.append(sFont);
            if((s = (String)cnf.get(String.valueOf(j1))) != null)
            {
                if(sunDay)
				sunDay=false;

				stringbuffer.append("<font face=\"Arial\" size=\"2\" color=\"#FF0000\" ><b>");
				stringbuffer.append("<a href=\"");
                if(s.toUpperCase().startsWith("HTT") || s.indexOf(".") > 0)
                {
                    stringbuffer.append(s);
                    if(s.indexOf("?") < 0)
                        stringbuffer.append("?date=" + stringDate(gregoriancalendar));
                    else
                        stringbuffer.append("&date=" + stringDate(gregoriancalendar));
                } else
                {
                    stringbuffer.append("javascript:" + s + "('" + stringDate(gregoriancalendar) + "');");
                }
                stringbuffer.append("\"");
                if((s = (String)cnf.get(j1 + "target")) != null)
                    stringbuffer.append(" target=\"" + s + "\"");
                stringbuffer.append(">");
                
				stringbuffer.append(gregoriancalendar.get(5));
                stringbuffer.append("</font></a></b>\n");
            } else
            {
                if(sunDay){
				stringbuffer.append("<font face=\"Arial\" size=\"2\" color=\"#FF0000\" ><b>"+String.valueOf(j1));
				stringbuffer.append("</b></font>");
				sunDay =false;
				}else{
				stringbuffer.append(String.valueOf(j1));
				}
            }
            if(sFont != null)
            stringbuffer.append("</td>\n");
            if(k1 == 0)
                stringbuffer.append("</tr>\n");
        }

        if(j < 7)
        {
            for(; j < 7; j++)
            {
				stringbuffer.append("<td align=center bgcolor=\"#F8F8F8\">");
                if(sFont != null)
                    stringbuffer.append(sFont);
                stringbuffer.append("&nbsp;");
                if(sFont != null)
               
                stringbuffer.append("</td>\n");
            }

            stringbuffer.append("</tr>\n");
        }
        stringbuffer.append("</table>\n");
        return stringbuffer.toString();
    }

    public Locale getLocale()
    {
        return loc;
    }

    public int getMonth()
    {
        return month;
    }

    public int getStyle()
    {
        return style;
    }

    public int getYear()
    {
        return year;
    }

    public void setAction(int i, String s, String s1)
    {
        if(s != null)
        {
            cnf.put(String.valueOf(i), s);
            if(s1 != null && s1.length() > 0)
                cnf.put(i + "target", s1);
        }
    }

    public void setActions(String s, String s1)
    {
        for(int i = 1; i <= 31; i++)
            setAction(i, s, s1);

    }

    public void setLocale(Locale locale)
    {
        loc = locale;
    }

    public void setMonth(int i)
    {
        if(i >= 1 && i <= 12)
        {
            month = i;
            cnf.clear();
        }
    }

    public void setStyle(int i)
    {
        style = i;
    }

    public void setYear(int i)
    {
        if(i > 0)
        {
            year = i;
            cnf.clear();
        }
    }

    private String stringDate(Calendar calendar)
    {
        String s = String.valueOf(calendar.get(1));
        return s + twoDigits(calendar.get(2) + 1) + twoDigits(calendar.get(5));
    }

    private String twoDigits(int i)
    {
        String s = String.valueOf(i);
        if(s.length() == 1)
            return "0" + s;
        else
            return s;
    }

    
}

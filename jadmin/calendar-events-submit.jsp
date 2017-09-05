<%@ page import="com.google.api.client.auth.oauth2.Credential"%>
<%@ page import="com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp"%>
<%@ page import="com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver"%>
<%@ page import="com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow"%>
<%@ page import="com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets"%>
<%@ page import="com.google.api.client.googleapis.javanet.GoogleNetHttpTransport"%>
<%@ page import="com.google.api.client.http.HttpTransport"%>
<%@ page import="com.google.api.client.json.jackson2.JacksonFactory"%>
<%@ page import="com.google.api.client.json.JsonFactory"%>
<%@ page import="com.google.api.client.util.store.FileDataStoreFactory"%>
<%@ page import="com.google.api.client.util.DateTime"%>


<%@ page import="com.google.api.services.calendar.CalendarScopes"%>
<%@ page import="com.google.api.services.calendar.model.*"%>

<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>

<%@ page import="com.Quickstart" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String APPLICATION_NAME ="Google Calendar API Java Quickstart";

/** Directory to store user credentials for this application. */
java.io.File DATA_STORE_DIR = new java.io.File(
System.getProperty("user.home"), ".credentials/calendar-java-quickstart");

/** Global instance of the {@link FileDataStoreFactory}. */
FileDataStoreFactory DATA_STORE_FACTORY;

/** Global instance of the JSON factory. */
 JsonFactory JSON_FACTORY =JacksonFactory.getDefaultInstance();

/** Global instance of the HTTP transport. */
 HttpTransport HTTP_TRANSPORT;

/** Global instance of the scopes required by this quickstart.
*
* If modifying these scopes, delete your previously saved credentials
* at ~/.credentials/calendar-java-quickstart
*/
List<String> SCOPES =
Arrays.asList(CalendarScopes.CALENDAR_READONLY);

HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);



/**
* Creates an authorized Credential object.
* @return an authorized Credential object.
* @throws IOException
*/


InputStream in =
Quickstart.class.getResourceAsStream("/client_secret.json");
GoogleClientSecrets clientSecrets =
GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

//Build flow and trigger user authorization request.
GoogleAuthorizationCodeFlow flow =
    new GoogleAuthorizationCodeFlow.Builder(
            HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
    .setDataStoreFactory(DATA_STORE_FACTORY)
    .setAccessType("offline")
    .build();


com.google.api.services.calendar.Calendar service = new com.google.api.services.calendar.Calendar.Builder(
        HTTP_TRANSPORT, JSON_FACTORY, new AuthorizationCodeInstalledApp(
        	    flow, new LocalServerReceiver()).authorize("user"))
        .setApplicationName(APPLICATION_NAME)
        .build();


// List the next 10 events from the primary calendar.
DateTime now = new DateTime(System.currentTimeMillis());


Event event = new Event()
.setSummary("Event CAL")
.setLocation("KOCHIN")
.setDescription("event description");

DateTime startDateTime = new DateTime("2017-05-25T00:00:00");
EventDateTime startD = new EventDateTime()
.setDateTime(startDateTime)
.setTimeZone("Asia/Calcutta");
event.setStart(startD);

DateTime endDateTime = new DateTime("2017-05-27T00:00:00");
EventDateTime endD = new EventDateTime()
.setDateTime(endDateTime)
.setTimeZone("Asia/Calcutta");
event.setEnd(endD);


//String[] recurrence = new String[] {"RRULE:FREQ=DAILY;COUNT=2"};
//event.setRecurrence(Arrays.asList(recurrence));

EventAttendee[] attendees = new EventAttendee[] {
new EventAttendee().setEmail("jintumariajmj@gmail.com"),
new EventAttendee().setEmail("jintumariajmj@gmail.com"),
};
event.setAttendees(Arrays.asList(attendees));

EventReminder[] reminderOverrides = new EventReminder[] {
new EventReminder().setMethod("email").setMinutes(24 * 60),
new EventReminder().setMethod("popup").setMinutes(10),
};
Event.Reminders reminders = new Event.Reminders()
.setUseDefault(false)
.setOverrides(Arrays.asList(reminderOverrides));
event.setReminders(reminders); 

// Show events on user's calendar.



String calendarId = "primary";

event=service.events().insert(calendarId, event).execute();		
out.printf("Event created: %s\n", event.getHtmlLink());

%>


</body>
</html>
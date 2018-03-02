<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<input type="text" name="liveagent.prechat:caseServiceTag" />

<input type="hidden"
       name="liveagent.prechat.findorcreate.map:Case" 
       value="Origin,caseOrigin;Subject,caseSubject;Service_Tag__c,caseServiceTag;" />

<input type="hidden" 
       name="liveagent.prechat.findorcreate.map.doCreate:Case" 
       value="Origin,true;Subject,true;Service_Tag__c,true;" />

</body>
</html>
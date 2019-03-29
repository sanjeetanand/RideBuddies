<%@page import="com.ridebuddies.ridecreator.RideDao"%>
<%@page import="com.ridebuddies.riderequestor.RequestDto"%>
<%@page import="com.ridebuddies.riderequestor.RequestDao"%>
<%
if (session.getAttribute("phone") == null) {
	response.sendRedirect("index.jsp?msg=loginfirst");
}
String type=request.getParameter("type");
if(type != null){
	String creater = (String)session.getAttribute("phone");
	String requester = request.getParameter("requester");
	if(type.equals("accept")){
		if(new RequestDao().findAccReq(creater) == null){
			if(new RequestDao().acceptRequest(creater, requester) ){
				new RequestDao().delOtherRequest(creater, requester);
				response.sendRedirect("../requesterdetail.jsp?msg=rideaccepted");
			} else {
				response.sendRedirect("../requesterlist.jsp?msg=cannotaccept");
			}
		} else {
			response.sendRedirect("../requesterdetail.jsp?msg=ridealreadyaccepted");
		}	
	} else if(type.equals("decline")){
		if(new RequestDao().viewStatus(creater,requester).equals("accept")){
			response.sendRedirect("../requesterdetail.jsp?msg=acceptedridecannotbedel");
		} else {
			RequestDto dto = new RequestDto();
			dto.setCreater(creater);
			dto.setRequester(requester);
			dto.setStatus("pending");
			if(new RequestDao().delRequest(dto)){
				response.sendRedirect("../requesterlist.jsp?msg=reqDeclined");
			} else {
				response.sendRedirect("../requesterlist.jsp?msg=reqNotDeclined");
			}
		}
	} else if(type.equals("complete")){
		if(new RideDao().deleteRide(creater)){
			if(new RequestDao().delAllRequest(creater) && new RideDao().completeRide(creater, requester)){
				response.sendRedirect("../home.jsp?msg=rideCompleted");
			} else {
				response.sendRedirect("../home.jsp?msg=rideCompletedWithoutReq");
			}
		} else {
			response.sendRedirect("../home.jsp?msg=DontLie");
		}
	}
}
%>
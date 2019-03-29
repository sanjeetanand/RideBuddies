<%@page import="com.ridebuddies.ridecreator.RideDao"%>
<%@page import="com.ridebuddies.riderequestor.RequestDao"%>
<%@page import="com.ridebuddies.riderequestor.RequestDto"%>
<%
if (session.getAttribute("phone") == null) {
	response.sendRedirect("index.jsp?msg=loginfirst");
}
String type = request.getParameter("type");
if(type != null){
	if(type.equals("request")){
		String creater = request.getParameter("phone");
		String requester = (String)session.getAttribute("phone");
		if(creater != null && requester != null){
			if(new RequestDao().viewMyRequest(requester) == null){
				if(new RideDao().viewRide(requester) == null) {
					RequestDto dto = new RequestDto();
					dto.setCreater(creater);
					dto.setRequester(requester);
					dto.setStatus("pending");
					
					if(new RequestDao().addRequest(dto)){
						response.sendRedirect("../ridedetails.jsp?phone="+creater);
					} else {
						response.sendRedirect("../home.jsp?msg=notreq");
					}
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=rideExist");
				}
			} else {
				response.sendRedirect("../ridedetails.jsp?msg=reqExist&phone="+new RequestDao().viewMyRequest(requester).getCreater());
			}		
		} else {
			response.sendRedirect("../ridedetails.jsp?msg=null&&phone="+creater);
		}
	} else if(type.equals("cancel")){
		String creater = request.getParameter("phone");
		String requester = (String)session.getAttribute("phone");
		if(creater != null && requester != null){
			RequestDto dto = new RequestDto();
			dto.setCreater(creater);
			dto.setRequester(requester);
			dto.setStatus("pending");
			if(new RequestDao().delRequest(dto)){
				response.sendRedirect("../ridedetails.jsp?phone="+creater);
			} else {
				if(new RequestDao().viewStatus(creater,requester).equals("decline")){
					response.sendRedirect("../ridedetails.jsp?msg=declined");
				} else if(new RequestDao().viewStatus(creater,requester).equals("accept")){
					response.sendRedirect("../ridedetails.jsp?msg=accepted&&phone="+creater);
				} else {
					response.sendRedirect("../home.jsp?msg=rideGone");
				}
			}
		}
	} else if(type.equals("complete")){
		String creater = request.getParameter("phone");
		String requester = (String)session.getAttribute("phone");
		if(new RideDao().deleteRide(creater)){
			if(new RequestDao().delAllRequest(creater) && new RideDao().completeRide(creater, requester)){
				response.sendRedirect("../home.jsp?msg=rideCompleted");
			} else {
				response.sendRedirect("../home.jsp?msg=rideCompletedWithReq");
			}
		} else {
			response.sendRedirect("../home.jsp?msg=DontLie");
		}
	} else if(type.equals("requested")){
		String requester = (String)session.getAttribute("phone");
		RequestDto dto = new RequestDao().viewMyRequest(requester);
		if(dto == null){
			response.sendRedirect("../home.jsp?msg=norequestexist");
		} else {
			response.sendRedirect("../ridedetails.jsp?phone="+dto.getCreater());
		}
	}
}
%>
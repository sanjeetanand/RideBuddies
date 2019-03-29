
<%@page import="java.util.ArrayList"%>
<%@page import="com.ridebuddies.riderequestor.RequestDto"%>
<%@page import="com.ridebuddies.riderequestor.RequestDao"%>
<%@page import="com.ridebuddies.ridecreator.RideDto"%>
<%@page import="com.ridebuddies.ridecreator.RideDao"%>
<%
	if (session.getAttribute("phone") == null) {
		response.sendRedirect("index.jsp?msg=loginfirst");
	}
	String type = request.getParameter("type");
	if (type != null) {
		if (type.equals("create")) {
			String startCood = request.getParameter("startCood");
			String endCood = request.getParameter("endCood");
			String startLoc = request.getParameter("startLoc");
			String endLoc = request.getParameter("endLoc");
			String vehType = request.getParameter("vehType");
			String mobile = request.getParameter("mobile");
			int startTime = Integer.parseInt(request.getParameter("startTime"));
			int endTime = Integer.parseInt(request.getParameter("endTime"));
			int people = Integer.parseInt(request.getParameter("people"));
			int price = Integer.parseInt(request.getParameter("price"));
			String phone = (String) session.getAttribute("phone");
			if (startCood != null && endCood != null && startLoc != null && endLoc != null && vehType != null
					&& mobile != null && startTime > 00 && endTime > 00 && people > 0 && phone != null && price >= 0) {
				RideDto dto = new RideDao().viewRide(phone);
				RequestDto list = new RequestDao().viewMyRequest(phone);
				if (dto == null) {
					if (list == null) {
						dto = new RideDto();
						dto.setEndLoc(endLoc);
						dto.setEndTime(endTime);
						dto.setEndCood(endCood);
						dto.setStartCood(startCood);
						dto.setMobile(mobile);
						dto.setPeople(people);
						dto.setPhone(phone);
						dto.setStartLoc(startLoc);
						dto.setStartTime(startTime);
						dto.setVehType(vehType);
						dto.setPrice(price);
						if (new RideDao().createRide(dto)) {
							response.sendRedirect("../requesterlist.jsp");
						} else {
							response.sendRedirect("../createride.jsp?msg=createerror");
						}
					} else {
						response.sendRedirect("../ridedetails.jsp?msg=reqExist&&phone=" + list.getCreater());
					}
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=rideexist");
				}
			} else {
				response.sendRedirect("../createride.jsp?msg=null");
			}
		} else if (type.equals("delete")) {
			String phone = (String) session.getAttribute("phone");
			if (new RequestDao().findAccReq(phone) == null) {
				if (new RideDao().deleteRide(phone) && new RequestDao().delAllRequest(phone)) {
					response.sendRedirect("../home.jsp?msg=ridedelete");
				} else {
					response.sendRedirect("../requesterlist.jsp?msg=delerror");
				}
			} else {
				response.sendRedirect("../requesterdetail.jsp?reqAlreadyAccepted");
			}
		}
	}
%>
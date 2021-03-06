<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 - 취소된 예약 현황</title>
	<!--부트스트랩 import-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<%@page import="java.sql.*, javax.sql.*, javax.naming.*,
					java.util.*, mini_project.Cancelled_reservations" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<jsp:useBean 	id="reservations" class="mini_project.Reservations" 
					scope="request"/>
	<%
	InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection co = ds.getConnection();
	
	String sql = "SELECT * FROM cancelled_reservation";
	PreparedStatement ps = co.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	ArrayList <Cancelled_reservations> rl = new ArrayList<Cancelled_reservations>();
	while (rs.next()) {
		rl.add(new Cancelled_reservations(rs.getString(1), rs.getInt(2), rs.getString(3),rs.getString(4),
				rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
	}
	rs.close();
	ps.close();
	co.close();
	%>
	<jsp:include page="admin_header.jsp"/>
	<div class="row">
  		<jsp:include page="admin_sidebar.jsp"/>
  		<div class="col-11">
   		<!-- 페이지 내용 -->
      	<!-- 뭘 출력해야할까... -->
			<div class="jumbotron" style="background-color:aliceblue;">
				<h1 class="display-4">취소된 예약 현황</h1>
			</div>
			<div>
				<table class="table table-hover" style="text-align:center;">
					<tr>
						<th>
							이메일
						</th>
						<th>
							방 번호
						</th>
						<th>
							체크인
						</th>
						<th>
							체크아웃
						</th>
						<th>
							요구사항
						</th>
						<th>
							어른
						</th>
						<th>
							어린이
						</th>
						<th>
							가격
						</th>
						<th>
							취소된 일시
						</th>
					</tr>
					<c:set var="list" value="<%=rl %>"/>
						<c:forEach var="record" items="${list}">
						<tr>
							<td>${record.email}</td>
							<td>${record.roomNumber}</td>
							<td>${record.checkin}</td>
							<td>${record.checkout}</td>
							<td style="overflow:auto;">${record.requirement}</td>
							<td>${record.adults}</td>
							<td>${record.kids}</td>
							<td>${record.price}</td>
							<td>${record.cancelDate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
  		</div>
	</div>
</body>
</html>
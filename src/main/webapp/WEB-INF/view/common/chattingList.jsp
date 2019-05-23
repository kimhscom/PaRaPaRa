<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="container">
<%@include file="../header.jsp" %>
	<div class="bodyFrame">
	<div class="bodyfixed">
		<div class="oneDepth">
			<!-- oneDepth�� ���� ������ �� ex)������� -->
			<p class="text-primary" style="font-size: 40px;">ä��</p>
			
		</div> <!-- div class=oneDepth -->
		<div class="twoDepth">
			<!-- onDepth �ȿ� �ִ� twoDepth�� �� ex)1depth�� ��������� ��� a �±׿� ���� ������ ��������, ���, ���� ��  -->
			<ul class="nav nav-tabs">
  				<li class="nav-item">
    			 <a class="nav-link" data-toggle="tab" href="#home">ä�ø��</a>
  				</li>
			</ul>
			<div class="tab-content">
	<c:if test="${loginDto.auth eq 'A'}">
		<c:forEach items="${lists}" var="list">	
			<a href="./socketOpen.do?id=${list.owner_id}&auth=${loginDto.auth}&store_code=${list.store_code}">${list.owner_id}</a>
		</c:forEach>
	</c:if>
	<c:if test="${loginDto.auth eq 'U'}">
		<a href="./socketOpen.do?id=${adminDto.admin_id}&auth=${loginDto.auth}">${adminDto.admin_id}</a>
	</c:if>
	</div> <!-- div class=tab-content -->
</div> <!-- div class twoDepth -->
	</div> <!-- div class=bodyfixed -->
	</div> <!-- div class=bodyFrame -->
<%@include file="../footer.jsp" %>
</div>
</body>
</html>
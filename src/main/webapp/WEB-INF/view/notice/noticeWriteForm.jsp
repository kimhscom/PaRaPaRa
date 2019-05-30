<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>noticeWriteForm</title>
<style type="text/css">

#backBtn{
	position : absolute;
	right : 30px;
	bottom : 383px;
}

#subBtn{
	position : absolute;
	right : 110px;
	bottom : 383px;
}

#titleWrite{
 	position : absolute; 
	left : 145px;
	bottom : 340px;
	top: 166px;
}

table{
	text-align: center;
}

th{
	width: 120px;
	height : 45px;
	padding : 0px;
}

td{
	height : 45px;
	padding : 5px;
}

</style>
</head>
<script type="text/javascript">
	function listMove() {
		location.href="./selNoticeList.do";
	}
</script>
<body>

	<div id="container">
		<%@include file="../header.jsp"%>
		<div class="bodyFrame">
			<div class="bodyfixed">
				<div class="oneDepth">
					<!-- oneDepth에 적힐 내용이 들어감 ex)매장관리 -->
					<p>공지사항</p>
				</div>
				<!-- div class=oneDepth -->
				<div class="twoDepth">
					<!-- onDepth 안에 있는 twoDepth가 들어감 ex)1depth가 매장관리일 경우 a 태그에 적힐 내용은 일정관리, 재고, 발주 등  -->
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#home">공지사항</a></li>
					</ul>
					<div class="tab-content">

<div>
	<div>
		
		<form role="form" action="./regiNotice.do" method="post">
		<input type="hidden" name="loginDtoAuth" value="${loginDto.auth}">
			
		<table>
			<tr style="border:1px solid lightgray;">
				<th class="table-primary">작　성　자</th>
				<td style="text-align: left; width: 265px;">${admin_name}</td>
				<th class="table-primary">작　성　일</th>
				<td style="text-align: left;">${today}</td>
			</tr>
			<tr>
				<th class="table-primary">제　　　목</th>
				<td style="text-align: left;" colspan="4" width="895px;"></td>
			</tr>
		</table>
				<div id="titleWrite" style="width: 893px;">
					<input class="form-control form-control" type="text" placeholder="제목을 입력하세요" name="notice_title" required="required" />			
				</div>
				<input id="subBtn" class="btn btn-outline-success" type="submit"value="등　록">
				<input id="backBtn" class="btn btn-outline-primary" type="button" onclick="listMove()" value="목　록">
		<table>
			<tr>		
				<td style="padding: 2px; width: 1100px;">
					<div class="form-group">
					  <textarea class="form-control" style="text-align: left;" rows="15" id="comment" name="notice_content" placeholder="내용을 입력하세요" required="required"></textarea>
					</div>
				</td>
			</tr>
		</table>

		</form>
	</div>
	
</div>

					</div><!-- div class=tab-content -->
				</div><!-- div class twoDepth -->
			</div><!-- div class=bodyfixed -->
		</div><!-- div class=bodyFrame -->
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>
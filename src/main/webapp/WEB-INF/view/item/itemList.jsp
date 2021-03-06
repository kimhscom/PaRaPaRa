<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목 전체조회</title>
<link rel="stylesheet" href="./css/storeList.css">
<style type="text/css">
	#item_bottom{
		position: relative;
		margin: 10px;
	}
	#searchBtn{
		width: 300px;
		left: 400px;
		position: absolute;
	}
	#regBtn{
		right: 10px;
		position: absolute;
	}
	
</style>
</head>
<body>
<div id="container">
<%@include file="../header.jsp" %>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/2depthLink.js"></script>
<!-- <script type="text/javascript" src="./js/itemList.js"></script> -->
	<div class="bodyFrame">
		<div class="bodyfixed">
			<div class="oneDepth">
				<p>매장관리</p>
			</div>
			<div class="twoDepth">
				<ul class="nav nav-tabs">
	  				<li class="nav-item">
	    				<a class="nav-link" data-toggle="tab" onclick="selStoreList()" href="#">매장 정보</a>
	  				</li>
	  				<li class="nav-item">
	    				<a class="nav-link" data-toggle="tab" onclick="selPaoList()" href="#">발주</a>
	  				</li>
	  				<li class="nav-item">
	    				<a class="nav-link active" data-toggle="tab" onclick="selItemList()" style="border: 1px solid rgb(21,140,186);" href="#"><strong>품목</strong></a>
	  				</li>
				</ul>
				<div class="tab-content" style="overflow: auto; height: 360px;">
					<!-- 각자 내용들.. -->
<!-- 					<table class="table table-hover" > -->
					<table class="table" >
						<thead>
							<tr class="table-primary">
								<th>품목번호</th>
								<th>품목명</th>
								<th>가격</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(itemLists) eq 0}">
									<tr>
										<th colspan="5">등록된 품목이 없습니다.</th>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${itemLists}" var="itemDto">
										<tr>
											<td>${itemDto.item_seq}</td>
											<td>${itemDto.item_name}</td>
											<td>${itemDto.item_price}</td>
											<td><input type="button" class="btn btn-secondary" value="품목수정" onclick="modItem('${itemDto.item_seq}')"></td>
											<td><input type="button" class="btn btn-warning" value="품목삭제" onclick="delItem('${itemDto.item_seq}')"></td>
										</tr>
									</c:forEach>	
								</c:otherwise>
							</c:choose>
						
						</tbody>
					</table>
				</div>
				<div id="item_bottom">
					<div id="searchBtn" class="form-group row">
						<input style="width: 200px; margin-right: 5px;" class="form-control" type="text" id="searchItem" onkeypress="if(event.keyCode==13) $('#searchItemBtn').click()" width="400px;">
						<input type="button" id="searchItemBtn" class="btn btn-outline-primary" value="검색" onclick="searchItemList()">
					</div>
					<div id="regBtn">
						<input type="button" class="btn btn-outline-primary" id="btn" value="전체품목" onclick="selItemList()">
						<input type="button" class="btn btn-outline-success" id="btn" value="품목등록" onclick="regItem()">
					</div>
				</div>
					
			</div>
		</div>
	</div>
	
<%@include file="../footer.jsp" %>
</div>
<%-- 	${lists} --%>
<%-- 	${storeRow} --%>
<script type="text/javascript">
	
	// 품목 조회 시 키보드의 enter 시 조회가 되도록 처리 
	// enter의 keyCode 값은 13
	var enterSearch = function(){
		if (window.event.keyCode == 13) {
			// 품목 조회 function
			searchItemList();
		}
	}
	
	// 품목 등록 버튼 클릭 시 새 창으로 띄워줌
	var regItem = function() {
		window.open("./regItem.do","_blank","width=400, height=450, left=500");
// 		location.href = "./regItem.do";
	}
	
	// 품목 수정 버튼 클릭 시 새창으로 띄워줌 
	var modItem = function(itemSeq){
		window.open("./itemModiForm.do?item_seq="+itemSeq, "_blank","width=400, height=450, left=500");
	}
	
	// 품목 조회
	var searchItemList = function(){
		// 앞 뒤에 띄워쓰기가 있을 수 있으므로 trim으로 잘라줌
		var searchVal = document.getElementById("searchItem").value.trim();
// 		alert("trim 한 searchVal : " + searchVal);
		$.ajax({
			post : "get",
			url : "./searchItem.do",
			data : "item_name="+searchVal,
			dataType : "json",
			async : false,
			success: function (data) {
// 				alert(typeof data.count);
				if(data.count == 0){
					swal({
						title: "", 
						text: "검색된 항목이 존재하지 않습니다.", 
						type: "warning"
					},function(){
						selItemList();
					});
				}else{
					var htmlTable = "";
					$.each(data, function(key,value){
						if(key=="lists"){
							$.each(value,function(key, val){
								htmlTable += 	"<tr>"
													+"<td>"+val.item_seq+"</td>"
													+"<td>"+val.item_name+"</td>"
													+"<td>"+val.item_price+"</td>"
													+"<td><input type='button' class='btn btn-secondary' value='품목수정' onclick='modItem(\""+val.item_seq+"\")'></td>"
													+"<td><input type='button' class='btn btn-warning' value='품목삭제' onclick='delItem(\""+val.item_seq+"\")'></td>"
											+	"</tr>";
								
								
							}); // itemList를 뿌려주기 위한 value의 key val function
						} // key == lists
	//						alert(htmlTable);
					}); // data의 key value로 나눈 each문
					$(".table > tbody").html(htmlTable);
				}
			},
	        error: function (data) {
	        	swal("조회 에러", "조회 중 문제가 발생하였습니다.", "error");
	        }
		});
	}
	
	// 품목 삭제 버튼 클릭 시
	var delItem = function(itemSeq) {
		swal({
			title: "삭제 확인",
			text: "정말 삭제하시겠습니까?",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "lightgray",
			confirmButtonText: "취 소",
			cancelButtonText: "확 인",
			closeOnConfirm: false,
			closeOnCancel: false
		},
		function(isConfirm){
			if(isConfirm){ // confirmButtonText
				swal("취소", "품목 정보 삭제가 취소 되었습니다.", "error");
//	 			return false;
			} else{ // cancelButtonText
				// 확인 했을 때
				$.ajax({
					type: "post",
					url: "./delItem.do",
					data: "item_seq="+itemSeq,
					dataType : "json",
					async : false,
					success: function (data) {
			        	swal({
							title: "삭제 완료", 
							text: "품목 정보 삭제가 완료되었습니다", 
							type: "success"
						},
						function(){ 
							$.each(data, function(key,value){
								var htmlTable = "";
								
								if(key=="lists"){
									$.each(value,function(key, val){
										htmlTable += 	"<tr>"
															+"<td>"+val.item_seq+"</td>"
															+"<td>"+val.item_name+"</td>"
															+"<td>"+val.item_price+"</td>"
															+"<td><input type='button' class='btn btn-secondary' value='품목수정' onclick='modItem(\""+val.item_seq+"\")'></td>"
															+"<td><input type='button' class='btn btn-warning' value='품목삭제' onclick='delItem(\""+val.item_seq+"\")'></td>"
													+	"</tr>";
										
										
									}); // itemList를 뿌려주기 위한 value의 key val function
								} // key == lists
// 								alert(htmlTable);
								$(".table > tbody").html(htmlTable);
							}); // data의 key value로 나눈 each문
						}); //swal 뒤 function
					},
			        error: function (data) {
			        	swal("삭제 에러", "삭제 중 문제가 발생하였습니다.", "error");
			        }
				});
			}
		});
	}
</script>

</body>
</html>
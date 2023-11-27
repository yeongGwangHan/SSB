<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="./location/locationPopup.js"></script>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSB 상품주문서</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style>
	        .coupon-select {
            width: 100%;
            padding: 20px;
            margin-bottom: 20px;
            text-align: left;
        }

        textarea,
        select {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            margin-top: 8px;
            margin-bottom: 16px;
            font-size: 16px;
        }
        
        
</style>

<link rel="shortcut icon" href="./favicon/favicon.ico">
<!------------ common CSS ------------->
<link rel="stylesheet" href="${pageContext.request.contextPath}/saleItem/itemD.css">
</head>
<body>
	<div class="header">
	<c:import url="../Mcommon/top.jsp" charEncoding="UTF-8"/>
	</div>

<!-- 로그인을 수행한 관리자만 접근 가능 로그인 없이 접근한 경우 로그인페이지로 이동 -->
  <%-- <c:if test="${id == null }"> --%>
  <c:if test="${empty userId }">
	<c:redirect url="./MemberLogin.me"/>  	
  </c:if>



	<!-- section 시작 -->

	<section class="section" style="margin:5%; margin-left: 100px;">
		
		<!-- left-container 시작 -->
		<div class="left-container" style="margin: 15%; width: 70%;">
			<div class="col-md-7 col-lg-8" style="width: 100%;">
				<h4 class="mb-3">주문서</h4>
				<hr>
				<h4 class="mb-3">구매 희망 상품</h4>
				
				<form action="./OrderSalePay.od" method="post">
				
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">품번</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">옵션명</th>
							<th scope="col">옵션</th>
							<th scope="col">옵션추가금</th>
							
						</tr>
					</thead>
					<tbody>
		
						<tr>
							<td>${itemDTO.item_id }</td>
							<td>${itemDTO.item_name }</td>
							<td><fmt:formatNumber value="${itemDTO.item_price }"/> </td>
							<td>${itemDTO.options_name }</td>
							<td>${itemDTO.options_value }</td>
							<td>${itemDTO.options_price }</td>
						</tr>
				
					</tbody>
				</table>

				
				<hr class="my-4">



				<h4 class="mb-3">쿠폰</h4>
				<div class="coupon-select">
					<label for="coupon">쿠폰 선택:</label> 
					<select id="coupon" name="coupon">
						<option value="coupon1">사용가능한 쿠폰이 없습니다.</option>
						<!-- 추가 쿠폰 옵션 -->
					</select>
				</div>
				
				<h4 class="mb-3">배송지</h4>
				<select class="form-select form-select-lg mb-3" aria-label="Large select example" name="location_id" id="location_id">
 	 				<c:forEach var="ldto" items="${locaList}">
  					<option value="${ldto.location_id}">${ldto.location_name},${ldto.location_add }</option>
  					</c:forEach>
				</select>
				<div onclick="listPopup()">
					배송지 목록
				</div>
				
				<div>
					<input type="hidden" name=strCartList value="${strCartList}">
				</div>
				

				<hr>
				<h4 class="mb-3">할인적용</h4>
				<hr>
				<h4 class="mb-3">총 가격</h4>  <h4 class="mb-3"></h4> 
		
				<div style="margin-left:25%">
					<input type="submit" class="btn btn-secondary btn-lg" style="width:25%" value="결제"></button>
					<button type="button" class="btn btn-secondary btn-lg" style="width:25%">취소</button>
				</div>
				</form>
		</div>
		
	</div>
<!-- right-container 끝 -->

	</section>

	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>

 	<script src="../saleItem/js/itemD.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
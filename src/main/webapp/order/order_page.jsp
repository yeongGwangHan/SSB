<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="./location/locationPopup.js"></script>

<script type="text/javascript">
	function toggleCategory() {
		var categoryContent = document.querySelector('.category-content');
		var brandContent = document.querySelector('.brand-content');

		categoryContent.style.display = 'block';
		brandContent.style.display = 'none';
	}

	function toggleBrand() {
		var categoryContent = document.querySelector('.category-content');
		var brandContent = document.querySelector('.brand-content');

		categoryContent.style.display = 'none';
		brandContent.style.display = 'block';
	}
</script>

<!-- ��� �޴��� ���� �� ���� Ȯ�� -->
<script>
	document.addEventListener("DOMContentLoaded", function() {

		const submenus = document.querySelectorAll(".menu .submenu");
		const submenuContents = document.querySelectorAll(".submenu-content");

		submenus.forEach(function(submenu, index) {
			const submenuContent = submenuContents[index];

			// �޴� �׸��� ȣ���� ��
			submenu.addEventListener("mouseover", function() {
				// �ش� �޴� �׸��� ���� �޴��� ǥ�õǸ� �޴��� ���̸� ����
				submenuContent.style.display = "block";
				submenu.style.height = submenuContent.clientHeight + "px";
			});

			// �޴� �׸񿡼� ���콺�� ���� ��
			submenu.addEventListener("mouseout", function() {
				// �ش� �޴� �׸��� ���� �޴��� �������� �޴��� ���̸� ������� ����
				submenuContent.style.display = "none";
				submenu.style.height = "auto";
			});
		});
	});
</script>


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSB Layout</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link href="./main/main_css/main.css" rel="stylesheet">

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

<!-- �ĺ��� -->
<link rel="shortcut icon" href="./main/img/favicon.ico">

</head>

<body>

	<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	<div class="header">
		<jsp:include page="../Mcommon/top.jsp" />
	</div>
	<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->



	<!-- section ���� -->

	<section class="section" style="margin:5%; margin-left: 100px;">
		
		<!-- left-container ���� -->
		<div class="left-container" style="margin: 15%; width: 70%;">
			<div class="col-md-7 col-lg-8" style="width: 100%;">
				<h4 class="mb-3">�ֹ���</h4>
				<hr>
				<h4 class="mb-3">���� ��� ��ǰ</h4>
				
				<form action="./OrderSalePay.od" method="post">
				
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">ǰ��</th>
							<th scope="col">��ǰ��</th>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">�ɼ�</th>
							<th scope="col">�ɼ��߰���</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="item" items="${requestScope.cartList}">
						<tr>
							<td>${item.item_id}</td>
							<td>${item.item_name }</td>
							<td><fmt:formatNumber value="${item.item_price }"/> </td>
							<td>${item.cart_quantity}</td>
							<td>${item.options_value}</td>
							<td style="text-align: center;">${item.options_price}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>

				
				<hr class="my-4">



				<h4 class="mb-3">����</h4>
				<div class="coupon-select">
					<label for="coupon">���� ����:</label> 
					<select id="coupon" name="coupon">
						<option value="coupon1">����Ҽ� �ִ� ������ �����ϴ�.</option>
						<!-- �߰� ���� �ɼ� -->
					</select>
				</div>
				
				<!-- 11�� 23�� �߰� (���ϸ��� ���) ���� -->
					<h4 class="mb-3">����Ʈ</h4>
					<div class="point">
						<label for="point" class="form-label">��밡���� ����Ʈ : ${user.member_point}</label> 
						<input type="number" class="form-control" max=${user.member_point } name="usePoint" id="usePoint">
					</div><br>
					

				<!-- 11�� 23�� �߰� (���ϸ��� ���) �� -->
				
				<h4 class="mb-3">�����</h4>
				<select class="form-select form-select-lg mb-3" aria-label="Large select example" name="location_id" id="location_id">
 	 				<c:forEach var="ldto" items="${locations}">
  					<option value="${ldto.location_id}">${ldto.location_name},${ldto.location_add }</option>
  					</c:forEach>
				</select>
				<div onclick="listPopup()">
					����� ���
				</div>
				
				<div>
					<input type="hidden" name=strCartList value="${strCartList}">
				</div>
				

				<hr>
				<h4 class="mb-3">��������</h4>
				<hr>
			
				
				<h4 class="mb-3">�� ����</h4>  <h4 class="mb-3"><fmt:formatNumber value="${totalPrice }"/>  ��</h4> 
		
				<div style="margin-left:25%">
					<input type="submit" class="btn btn-secondary btn-lg" style="width:25%" value="����"></button>
					<button type="button" class="btn btn-secondary btn-lg" style="width:25%">���</button>
				</div>
				</form>
		</div>
		
	</div>
<!-- right-container �� -->

	</section>

	<!-- footer ���� -->
	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>
	<!-- footer �� -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

<script>
	document.getElementById("usePoint").defaultValue = '0';
</script>


</body>

</html>





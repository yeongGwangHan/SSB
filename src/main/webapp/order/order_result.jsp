<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

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
<link href="./rental/rental_css/rental.css" rel="stylesheet">

<!-- �ĺ��� -->
<link rel="shortcut icon" href="./main/img/favicon.ico">
</head>

<body>

	<!-- �Ǹ� �� �� ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	<div class="header">
		<jsp:include page="../rental/Rcommon/top.jsp" />
	</div>
	<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->

	

	<!-- ��Ż �� �� ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->
	<div class="header">
		<jsp:include page="../rental/Rcommon/top.jsp" />
	</div>
	<!-- ���/ ��ܸ޴��� ���� top.jsp ���� ������ ��� -->



	<!-- section ���� -->

	<section class="section" style="margin: 5%;">

		<!-- ���� �������� �°� �����Ϸ��� ���� �Ʒ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->

		<!-- left-container ���� -->
		<div class="left-container" style="margin: 10%; margin-left:400px; width: 60%;">
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">���� ����</h4>
				<hr>
				<h4 class="mb-3">���� ����</h4>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">���� ��ȣ</th>
							<td>${payment.merchantUid}</td>
						</tr>

						<tr>
							<th scope="col">�����ݾ�</th>
							<td><fmt:formatNumber value="${payment.paidAmount}"/>��</td>
						</tr>

						<tr>
							<th scope="col">�������</th>
							<td>${payment.paidMethod}</td>
						</tr>

						<tr>
							<th scope="col">���� ����</th>
							<td>${payment.pgProvider}</td>
						<tr>
						<tr>
							<th scope="col">���� ����</th>
							<td>${payment.status}</td>
						<tr>
					</thead>

				</table>

				<hr>

				<hr class="my-4">

				<a class="btn btn-secondary" role="button" aria-disabled="true">������������
					����</a> <a class="btn btn-secondary" role="button" aria-disabled="true" href="./myPage.mp">
					�ֹ�����</a>


			</div>
		</div>
		</main>

		</div>



		<!-- ���� �������� �°� �����Ϸ��� ������� �����ϰ�, ���� ����� �˴ϴ�. Ȥ�� ���� ����� ���Ǳ��� ���� �غ��°� ��õ!!!!-->
	</section>
	<!-- section ��  -->

	<!-- footer ���� -->
	<footer class="footer">
		<p>&copy; 2023 SSB Style</p>
	</footer>
	<!-- footer �� -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>




</body>

</html>
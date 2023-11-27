$('#options_idSelecter').change(function() {
    var html = "<div class='cartDiv'>";
    var selectedOption = $("#options_idSelecter option:selected");
    var optionsName = selectedOption.data("options-name");
    var optionsValue = selectedOption.data("options-value");
    var cartQuantity = $("#cart_quantitySelecter").val();
    var optionsId = $("#options_idSelecter").val();
    
	$("#cartPool .cartDiv").each(function() {
		if($(this).find('.options_id').val() == optionsId){
			alert('이미 추가된 상품입니다');
			return false();
		}
	});
    
    html += "<input type='hidden' class='item_id' value='" + $("#item_idSelecter").val() + "'>";
    html += "<span class='options_name'>" + optionsName + "</span>";
    html += "<span class='options_value'>" + optionsValue + "</span>";
    html += "<input type='number' class='cart_quantity' value='" + cartQuantity + "' min='1' max='10'>";
    html += "<input type='hidden' class='options_id' value='" + optionsId + "'>";
    html += "<input type='button' class='closeButton' value='close'>";
    html += "</div>";
    $("#cartPool").append(html);
});


$(document).on("click",".closeButton",function(){
	$(this).parent().detach();
});
function getCartDiv(){
	var arr = new Array;
	$("#cartPool .cartDiv").each(function() {
		let cartItem = {
  		"item_id" : $(this).find('.item_id').val(),
  		"cart_quantity" : $(this).find('.cart_quantity').val(),
  		"options_id" : $(this).find('.options_id').val()
		};
		arr.push(cartItem);
	});
	return arr;
}

function addCart(type) {
	var arr = getCartDiv();
	if(arr.length == 0){
		alert('옵션을 선택해 주세요');
		return false;
	}
	$.ajax({
		type: "POST",
		url: "./insertCart.ca",
		dataType: "text",
		data: {
			"arr": JSON.stringify(arr),
			"type": type
		},
		error: function() {
			alert('통신실패!!');
		},
		success: function(data) {
			if(data == -1){
				if (confirm("이미 장바구니에 담긴 상품이 있습니다.\n장바구니로 이동하시겠습니까?") == true) {
					location.href = "./cartList.ca";
				} else {
					return false;
				}
			}else if(data == -2){
				if (confirm("장바구니로 이동하시겠습니까?") == true) {
					location.href = "./cartList.ca";
				} else {
					return false;
				}
			}else if(data == -3){
				alert("장바구니 담기 오류");
			}else{
				var input = data.replaceAll('"', "");
				location.href = "./Order.od?checkArray="+input;
			}
		}
	});
};
function setCart(){
	var html = "<div class='cartDiv'>";
	html += "<input type='input' class='item_id' value='" + $("#item_idSelecter").val() + "'>";
	html += "<input type='input' class='cart_quantity' value='" + $("#cart_quantitySelecter").val() + "'>";
	html += "<input type='input' class='options_id' value='" + $("#options_idSelecter").val() + "'>";
	html += "<input type='button' class='closeButton' value='close'>";
	html += "</div>";
	$("#cartPool").append(html);
}









/* header js 코드 영역 접어둠. */
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


/* 상단 메뉴바 오픈 및 영역 확장 js코드 접어둠 */
document.addEventListener("DOMContentLoaded", function() {

	const submenus = document.querySelectorAll(".menu .submenu");
	const submenuContents = document.querySelectorAll(".submenu-content");

	submenus.forEach(function(submenu, index) {
		const submenuContent = submenuContents[index];

		// 메뉴 항목을 호버할 때
		submenu.addEventListener("mouseover", function() {
			// 해당 메뉴 항목의 하위 메뉴가 표시되면 메뉴의 높이를 조절
			submenuContent.style.display = "block";
			submenu.style.height = submenuContent.clientHeight + "px";
		});

		// 메뉴 항목에서 마우스가 나갈 때
		submenu.addEventListener("mouseout", function() {
			// 해당 메뉴 항목의 하위 메뉴가 숨겨지면 메뉴의 높이를 원래대로 복원
			submenuContent.style.display = "none";
			submenu.style.height = "auto";
		});
	});
});






document.addEventListener('DOMContentLoaded', function() {
    const content = document.querySelector('.detailinfo > .content');
    const btnOpen = document.querySelector('.btn_open');
    const btnClose = document.querySelector('.btn_close');

    btnOpen.addEventListener('click', function(e) {
        content.style.maxHeight = 'none'; // 변경된 부분
        btnOpen.classList.add('hide');
        btnClose.classList.remove('hide');
    });

    btnClose.addEventListener('click', function(e) {
        content.style.maxHeight = '300px'; // 변경된 부분
        btnOpen.classList.remove('hide');
        btnClose.classList.add('hide');
    });
});





/*Q&A 목록 펼치고 닫기 게시판!*/	
window.onload = () => {
	  // panel-faq-container
	  const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
	  
	  // panel-faq-answer
	  let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

	  // btn-all-close
	  const btnAllClose = document.querySelector("#btn-all-close");
	  
	  // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
	  for(let i=0;i < panelFaqContainer.length; i++) {
	    panelFaqContainer[i].addEventListener('click', function() { // 클릭 시 처리할 일
	      // Q&A 제목 클릭 시 -> 본문 보이게 -> active 클래스 추가
	      panelFaqAnswer[i].classList.toggle('active');
	    });
	  };
	  
	  btnAllClose.addEventListener('click', function() {
	    // 버튼 클릭시 처리할 일  
	    for(let i=0; i < panelFaqAnswer.length; i++) {
	        panelFaqAnswer[i].classList.remove('active');
	    };
	  });
	}
	
	
	
	
	
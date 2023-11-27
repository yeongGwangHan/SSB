package com.ssb.adItem.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.adItem.db.ItemDAO;
import com.ssb.adItem.db.ItemDTO;
import com.ssb.category.db.CategoryDAO;
import com.ssb.rental.db.RentalDAO;
import com.ssb.rental.db.RentalDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class ItemAddAction implements Action {
	  @Override
	    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

	        // 기존 카테고리 정보
	        int categoryCode = Integer.parseInt(request.getParameter("category_code"));
	        String categorySport = request.getParameter("category_sport");
	        String categoryMajor = request.getParameter("category_major");
	        String categorySub = request.getParameter("category_sub");
	        String categoryBrand = request.getParameter("category_brand");

	        // 기존의 카테고리 ID 찾기 -> 새로 등록하는 상품에 부여함
	        int categoryId = new CategoryDAO().findOrCreateCategory(categorySport, categoryMajor, categorySub, categoryBrand, categoryCode);

	        ItemDTO dto = new ItemDTO();
	        RentalDTO rdto = new RentalDTO();

	        // 판매 / 렌탈 구분
	        if (categoryCode == 1) { // 판매인 경우
	            setCommonFields(dto, request, categoryId);
	            setItemFields(dto, request);

	            new ItemDAO().addItem(dto); // ItemDAO 객체 생성 - 상품 등록 메서드 호출
	        } else if (categoryCode == 2) { // 렌탈인 경우
	            setCommonFields(rdto, request, categoryId);
	            setRentalFields(rdto, request);

	            new RentalDAO().addRental(rdto); // RentalDAO 객체 생성 - 렌탈 등록 메서드 호출
	
	            
	        }

	        // 페이지 이동 준비
	        ActionForward forward = new ActionForward();
	        forward.setPath("./ItemMgt.it");
	        forward.setRedirect(true);

	        return forward;
	    }
    
    

    private void setCommonFields(Object dto, HttpServletRequest request, int categoryId) {
        if (dto instanceof ItemDTO) {
            ItemDTO itemDTO = (ItemDTO) dto;
            itemDTO.setCategory_id(categoryId);
            itemDTO.setCategory_code(Integer.parseInt(request.getParameter("category_code")));
            itemDTO.setCategory_sport(request.getParameter("category_sport"));
            itemDTO.setCategory_major(request.getParameter("category_major"));
            itemDTO.setCategory_sub(request.getParameter("category_sub"));
            itemDTO.setCategory_brand(request.getParameter("category_brand"));
        } else if (dto instanceof RentalDTO) {
            RentalDTO rentalDTO = (RentalDTO) dto;
            rentalDTO.setCategory_id(categoryId);
            rentalDTO.setCategory_code(Integer.parseInt(request.getParameter("category_code")));
            rentalDTO.setCategory_sport(request.getParameter("category_sport"));
            rentalDTO.setCategory_major(request.getParameter("category_major"));
            rentalDTO.setCategory_sub(request.getParameter("category_sub"));
            rentalDTO.setCategory_brand(request.getParameter("category_brand"));
        }
    }


    private void setItemFields(ItemDTO dto, HttpServletRequest request) {
        dto.setItem_name(request.getParameter("item_name"));
        dto.setItem_price(Integer.parseInt(request.getParameter("item_price")));
        dto.setItem_img_main(request.getParameter("item_img_main"));
        dto.setItem_img_sub(request.getParameter("item_img_sub"));
        dto.setItem_img_logo(request.getParameter("item_img_logo"));
        dto.setOptions_name(request.getParameter("options_name"));
        dto.setOptions_value(request.getParameter("options_value"));
        dto.setOptions_quantity(Integer.parseInt(request.getParameter("options_quantity")));
    }

    private void setRentalFields(RentalDTO rdto, HttpServletRequest request) {
    	rdto.setRental_item_name(request.getParameter("rental_item_name"));
    	rdto.setRental_item_price(Integer.parseInt(request.getParameter("rental_item_price")));
    	rdto.setRental_days(Integer.parseInt(request.getParameter("rental_days")));
    	rdto.setRental_img_main(request.getParameter("rental_img_main"));
    	rdto.setRental_img_sub(request.getParameter("rental_img_sub"));
    	rdto.setRental_img_logo(request.getParameter("rental_img_logo"));
    	rdto.setRental_opt_name(request.getParameter("rental_opt_name"));
    	rdto.setRental_opt_value(request.getParameter("rental_opt_value"));
    	rdto.setRental_opt_quantity(Integer.parseInt(request.getParameter("rental_opt_quantity")));

    	}	
    }



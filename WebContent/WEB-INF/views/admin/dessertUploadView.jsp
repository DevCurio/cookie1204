<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="product.model.vo.Dessert"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<form action="<%=request.getContextPath()%>/admin/dessertUpload" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend>신제품 등록하기</legend>
            <div>
                <label for="Category">Category : </label>
                <select name="Category" id="Category">
                    <option value="마들렌" selected>마들렌</option>
                    <option value="휘낭시에">휘낭시에</option>
                    <option value="케익">케익</option>
                    <option value="Special">Special</option>
                    
                </select>
            </div>
            <br>
            <div>
                <label for="dessert_name">이름 : </label>
                <input type="text" name="dessert_name">
            </div>
            <br>
            <div>
                <label for="dessert_price">가격(￦): </label>
                <input type="text" name="dessert_price">
            </div>
            <br>
            <div>
                <label for="memo">설명:</label>
                <br>
                <textarea   name="memo" id="memo" 
                        cols="60" rows="5" 
                        placeholder="Description"
                        style="resize: none;"></textarea>
            </div>
            <br>

            <div>
                <label for="amount">등록 수량 :</label>
                <input type="number" name="amount" id="amount" placeholder="수량을 입력하세요(0~200)"
                max="200" min="0" step="1"
                style="width: 150px;">
            </div>
            
            <br><br>
            <input type="file" name="upload-file" id="upload-file" accept="image/*">
            <br>
            <br>
            <div>
                인기상품등록:
                <input type="radio" name="is_popular" id="popular_yes" checked value="Y">
                <label for="popular_yes">Y</label>
                <input type="radio" name="is_popular" id="popular_no" value="N">
                <label for="popular_no">N</label>
            </div>

            <br>
            <input type="submit" value="등록">
    	</fieldset>
    </form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<style>
	
	#patissier_table{
		position:relative
	}
	
	.patissier_table{
  		border-spacing: 100px;
 		border-collapse: separate;
 		margin:30px auto;

	}
	
	.patissier_picture{
		border-radius: 50%;
	}
	</style>
			
	<h1>patisserie Profile</h1>
        <hr>
        <p style="text-align: center; font-weight: bold;">Owner Pâtissier</p>
        <hr>
        
        <div id="patissier_Container">
	        <table class="patissier_table">
	            <tr>
	                <td>
	                    <div class="patissier_picture">
	                    	<img class="patissier_picture" src="<%=request.getContextPath()%>/images/kang.PNG" alt="파티시에">
	                    </div>        
	                </td>
					
	                <td>
	                    <div class="patissier_information">
	                    	<h3>Hyunji Kang (강현지)</h3>
	                        <ul>
	                            <li>Owner Pâtissier(2020~Present)</li>
	                            <li>베이킹 클래스 공방 "과자방"</li>
	                        </ul>
	                        <br />
	                        <h3>Education</h3>
	                        <ul>
	                            <li>북미 요리대학교 Johnson & Wales University 식음료 전공, 베이킹 부전공</li>
	                            <li>Ecole Lenotre 프랑스 제과 디플로마</li>
	                        </ul>
	                        <br />
	                        <h3>Work Experience</h3>
	                        <ul>
	                            <li>Jean Georges Restaurant 인턴</li>
	                            <li>프랑스 디저트 카페 "마얘"- Sous -Chef 근무(부주방장)</li> 
	                        </ul>
	                    </div>
	                </td>
	
	            </tr>
	        </table>
	        <hr>
	        <table class="patissier_table">
	            <tr>
	                <td>
	                    <div class="patissier_picture">
	                        <img class="patissier_picture" src="<%=request.getContextPath()%>/images/jung.PNG" alt="파티시에">
	                    </div>
	                </td>
	                <td>
	                    <div class="patissier_information">
	                        <h3>Yonghyun Jung (정용현)</h3>
	                        <ul>
	                        	<li>Owner Pâtissier(2020~Present)</li>
	                        	<li>베이킹 클래스 공방 "과자방"</li>
	                        </ul>
	                        <br />
	                        <h3>Education</h3>
	                        <ul>
	                            <li>Nakamura Academy 졸업 (나카무라 아카데미 : 전문 제과학교)</li>
	                         </ul>
	                         <br />
	                        <h3>Work Experience</h3>
	                        <ul>
	                            <li>프랑스식 디저트 카페 "로브니" - 파티시에 근무</li>
	                            <li>엔그릴 근무 - 프렌치 레스토랑</li>
	                        </ul>
	                    </div>
                	</td>
            	</tr>
        	</table>
        </div>
        		
        
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
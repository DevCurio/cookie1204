<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>
			
	<h1>patisserie Profile</h1>
        <hr>
        <p style="text-align: center; font-weight: bold;">Owner Pâtissier</p>
        <hr>
        <table>
            <tr>
                <td>
                    <div>
                    	<img src="<%=request.getContextPath()%>/images/profile/강현지.PNG" alt="파티시에">
                    </div>        
                </td>
				<td>
				</td>
                <td>
                    <div>
                        <h5>Hyunji Kang (강현지)</h5>
                        <p>Owner Pâtissier(2020~Present)</p>
                        <p> 베이킹 클래스 공방 "과자방"</p>
                        <h5>Education</h5>
                        <ul>
                            <li>북미 요리대학교 Johnson & Wales University 식음료 전공, 베이킹 부전공</li>
                            <li>Ecole Lenotre 프랑스 제과 디플로마</li>
                        </ul>
                        <h5>Work Experience</h5>
                        <ul>
                            <li>Jean Georges Restaurant 인턴</li>
                            <li>프랑스 디저트 카페 "마얘"- Sous -Chef 근무(부주방장)</li> 
                        </ul>
                    </div>
                </td>

            </tr>
        </table>
        <br>
        <hr>
        <br>
        <table>
            <tr>
                <td>
                    <div>
                        <img src="<%=request.getContextPath()%>/images/profile/정용현.PNG" alt="파티시에">
                    </div>
                </td>
                <td>
                    <div>
                        <h5>Yonghyun Jung (정용현)</h5>
                        <p>Owner Pâtissier(2020~Present)</p>
                        <p> 베이킹 클래스 공방 "과자방"</p>
                        <h5>Education</h5>
                        <ul>
                            <li>Nakamura Academy 졸업 (나카무라 아카데미 : 전문 제과학교)</li>
                         </ul>
                        <h5>Work Experience</h5>
                        
                        <ul>
                            <li>프랑스식 디저트 카페 "로브니" - 파티시에 근무</li>
                            <li>엔그릴 근무 - 프렌치 레스토랑</li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
        <br>
        <br>			
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
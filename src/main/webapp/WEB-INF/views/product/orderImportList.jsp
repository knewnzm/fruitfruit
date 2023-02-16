<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<button class="add-btn" type="button" onclick="location.href=`${pageContext.request.contextPath}/product/mylist`">
	내 판매 목록
</button>

<div class="p-wrap">
	<div class="p-card">
		<div> 
			<div class="import-item">
				<div class="img-box">
					<img class="product-pimg" src="${p.product_path}" alt="${p.product_title}"/> 
				</div>
				
				<div class="desc-box">
					<div class="product-header">
						<h1 class="product-name">
							${p.product_title}&nbsp; 
						</h1>
					</div>
                  
					<div class="product-detail">
						<div>
							<fmt:formatNumber pattern="#,###원" value="${p.product_price}"></fmt:formatNumber>
							<div>등록일 : ${p.product_date}</div>
							<div>조회수 : ${p.product_hit}</div>
							<div>판매자 : ${p.product_seller_id }</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div>
	<table  class="list">
		<tbody>
			<tr>
			<th>구매자 이름</th> <th>구매 수량</th> <th>구매자 주소</th> <th>결제 금액</th> 
			</tr>
			
				<tr>
				<td>${p.product_title}</td> <td>${p.product_title}</td> <td>${p.product_title}</td> <td>${p.product_title}</td> <td><button class="cancel_btn">주문취소</button><button class="comple_btn">주문수락</button></td>
				</tr>
			
		</tbody>
	</table>
</div>

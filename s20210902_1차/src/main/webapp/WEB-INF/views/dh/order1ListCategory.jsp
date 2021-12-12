<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order1List</title>
<style type="text/css">
A:link {text-decoration:none; color: #646464;}
A:visited {text-decoration:none; color: #646464;}
A:active {text-decoration:none; color: #646464;}
A:hover {text-decoration:none; color: #646464;}
</style>
</head>
<body>
<h2>내가 주문한 내역</h2>
<c:set var="num" value="${pg.total-pg.start+1}"></c:set>
		<form action="order1ListCategory?currentPage=${pg.currentPage}" method="post">
		주문상태 :	<select name='o_cancel' required="required">
					<option value='' selected>-선택-</option>
					<option value='0'>주문대기</option>
					<option value='1'>주문확정</option>
					<option value='2'>주문취소</option>
				</select>
				<input type="submit" value="확인">&nbsp;&nbsp;
				<button type="button" onclick="location.href='order1List?currentPage=1'">목록</button>
		</form>
<table border="1">
	<thead>
		<tr>
			<th>상품정보</th><th>주문일자</th><th>주문번호</th><th>받으시는 분</th><th>받으시는 분 연락처</th><th>받으시는 분 주소</th><th>수량</th><th>금액</th><th>주문상태</th>
		</tr>
	</thead>
	<c:if test="${total > 0 }">
	<c:forEach var="order1C" items="${order1Category }">
	<tbody>
		<tr>
			<td>
				<div>
					<img src = "/${order1C.p_img }" style="width: 200px; height: 100px">
					<ul>
						<li>상품명 : ${order1C.p_name}</li>
						<li>사이즈 : ${order1C.content}</li>
					</ul>
				</div>
			</td>
			<td>${order1C.o_date }</td>
			<td>${order1C.o_num }</td>
			<td>${order1C.o_accept }</td>
			<td>${order1C.o_tel }</td>
			<td>${order1C.o_address }</td>
			<td>${order1C.p_qty }</td>
			<td>${order1C.sumValue }</td>
			<td>
			<c:set var ="o_cancel" value="${order1.o_cancel}"></c:set>
				<c:choose>
					<c:when test="${o_cancel eq '0'}">
						주문대기<br>
						<a href="order1Cancel?o_num=${order1.o_num}">[주문취소하기]</a>
					</c:when>
					<c:when test="${o_cancel eq '1'}">
						주문확정
					</c:when>
					<c:otherwise>
						주문취소
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</tbody>
	</c:forEach>
	</c:if>
		<c:if test="${total == 0 }">
		<tr>
			<td>주문하신 상품이 없습니다</td>
		</tr>
	</c:if>
</table>
<div>
<c:if test="${pg.startPage > pg.pageBlock }">
	<a href="order1ListCategory?currentPage=${pg.startPage-pg.pageBlock}&o_cancel=${o_cancel}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
	<a href="order1ListCategory?currentPage=${i}&o_cancel=${o_cancel}">[${i}]</a>
</c:forEach>
<c:if test="${pg.endPage < pg.totalPage }">
	<a href="order1ListCategory?currentPage=${pg.startPage+pg.pageBlock}&o_cancel=${o_cancel}">[다음]</a>
</c:if>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result >0 }">
	<script type="text/javascript">
		alert("성공적으로 주문되었습니다");
		location.href = "order1List";
	</script>
	</c:if >
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("주문에 실패하였습니다");
			history.back();
			</script>
		</c:if>
</body>
</html>
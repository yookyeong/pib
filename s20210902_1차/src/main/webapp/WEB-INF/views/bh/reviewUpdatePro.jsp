<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("리뷰가 수정 되었습니다.");
			location.href="bhDetail?p_code="+${p_code};
		</script>
	</c:if >
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("리뷰 수정에 실패하였습니다.");
			location.href="bhDetail?p_code="+${p_code};
		</script>
	</c:if>
</body>
</html>
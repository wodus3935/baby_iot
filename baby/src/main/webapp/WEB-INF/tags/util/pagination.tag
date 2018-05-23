<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="pagination" required="true" type="edu.iot.butter.model.Pagination" %>
<%@ attribute name="link" required="true" type="String" %>
<%@ attribute name="params" required="false" type="String" %>

<div class="text-center mt-4 mb-4">

	<c:if test="${pagination.currentBlock >1 }">
		<a href="${link}?page=1${params}">처음</a>
		<a href="${link}?page=${pagination.preBlockPage}${params}">◀</a>
	</c:if>
	
	<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="i">
		<c:if test="${i==pagination.page}">
			${i}
		</c:if>
		<c:if test="${i!=pagination.page}">
			<a href="${link}?page=${i}${params}">${i}</a>
		</c:if>
	</c:forEach>
		<c:if test="${pagination.currentBlock< pagination.totalBlock}">
			<a href="${link}?page=${pagination.nextBlockPage}${params}">▶</a>
			<a href="${link}?page=${pagination.totalPage}${params}">마지막</a>
		</c:if>
</div>
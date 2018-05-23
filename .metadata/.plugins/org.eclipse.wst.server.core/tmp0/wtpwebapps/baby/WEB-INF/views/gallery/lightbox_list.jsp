<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="iot" tagdir="/WEB-INF/tags/util"%>
<table>
	<tbody>
		<c:forEach var="image" items="${list}" varStatus="status">
		<tr>
			<td>
				<a href="image/${image.imageId}" data-lightbox="roadtrip">
					<img src="thumb/${image.imageId}" width="100" alt="${image.title}" class="z-depth-2 rounded">
				</a>
			</td>
			<td>
				<p>		
					<a href="download/${image.imageId}">${image.fileName}</a>
				</p>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

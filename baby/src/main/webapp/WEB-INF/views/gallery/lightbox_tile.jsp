<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="iot" tagdir="/WEB-INF/tags/util"%>
	<div class="row">
		<c:forEach var="image" items="${list}" varStatus="status">
			<div class="col-md-3 col-sm-4">
				<a href="image/${image.imageId}" data-lightbox="roadtrip">
					 <img src="thumb/${image.imageId}" alt="${image.title}">
				</a>
				<p>
					<a href="download/${image.imageId}" width="100" alt="${image.title}"> <i class="fa fa-download"></i>
					</a>
				</p>
			</div>
		</c:forEach>
	</div>
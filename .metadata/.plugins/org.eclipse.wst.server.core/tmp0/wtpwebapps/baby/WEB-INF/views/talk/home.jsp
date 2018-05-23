<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="m-4">
	<h2><i class="fa fa-comment"></i>Talk</h2>
	<hr/>
		<div class="row">
			<div class= "col-md-6">
				<c:forEach var="member" items="${memberList}">
					<img src="${root}member\avata?userId=${member.userId}" class="d-flex mr-3 rounded-circle avata-small">				
					<div class="media-body">
						<a href="with?userId=${USER.userId}&withTalk=${member.userId}">
							${member.userId}
						</a>
						<c:if test="${member.newMessages>0}">
							<span class="badge badge-pill pink">
								${member.newMessages}
							</span>
						</c:if>
					</div>					
				</c:forEach>
			</div>
			
			<!-- talk 리스트 -->
			<div class= "col-md-6">
				<c:forEach var="talk" items="${talkList}">
					<img src="${root}member/avata?userId=${member.userId}" class="d-flex mr-3 rounded-circle avata-small">				
					<div class="media-body talk-message">
						<a href="with?userId=${USER.userId}&withTalk=${talk.withTalk}">
							<div style="overflow:hidden">
								<div class="font-weight-bold float-left">${talk.withTalk}</div>
								<div class="small float-right">
									<fmt:formatDate value="${talk.regDate}" pattern="yyyy-MM-dd hh:mm:ss" />
								</div>
								</div>
							</div>		
						</a>			
				</c:forEach>
			</div>
			
		</div>	
</div>


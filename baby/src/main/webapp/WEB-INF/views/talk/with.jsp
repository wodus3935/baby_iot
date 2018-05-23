<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<link rel="stylesheet" href="<c:url value="/resources/css/talk.css"/>"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.js"></script>
<script src="<c:url value="/resources/js/talk.js"/>"></script>
<script src="<c:url value="/resources/js/rest.js"/>"></script>

<script>
	$(function(){		
		$('#messages').talk({
			userId : '${USER.userId}',
			withTalk : '${param.withTalk}',
			url : '/butter/talk',
			sendBtn : $('#send-btn'),
			sendMessage : $('#send-message')
		});
	})
</script>

<div class="m-4 mx-auto" style="width:500px">
	<div class="card border-primary mb-3">
		<div class="card-header">
			<h3>
				<i class="fa fa-comments primary"></i> ${param.withTalk}
			</h3>
		</div>
			
		<div class="card-body" style="height:20rem; overflow : scroll " >
			<!-- 전송 , 수신 메시지 출력 -->
			<div id="messages"></div>
		</div>
		<div class="card-footer py-2">
			<div class="md-form input-group my-0">
				<input type="text" id="send-message" class="form-control my-0 py-0">
				<span class="input-group-btn">
					<button id="send-btn" class="my-0 btn btn-primary btn-sm">
						<i class="fa fa-paper-plane"></i>
					</button>
				</span>
			</div>
		</div>
	</div>
</div>




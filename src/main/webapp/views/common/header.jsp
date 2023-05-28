<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.web.member.model.dto.Member" %>
<%
	Object obj = session.getAttribute("memberLoggedIn");
	Member memberLoggedIn = null;
	
	if (obj != null) {
		memberLoggedIn = Member.class.cast(obj);
	}
%>
<header class="px-3 py-3">
	<div class="d-flex justify-content-between align-items-center">
		<h1 class="fw-bolder">HEADER</h1>
		<% if (memberLoggedIn == null) { %>
		<form action="<%= request.getContextPath() %>/login.do" method="post">
			<div class="account d-flex justify-content-between">
				<div class="account_left d-flex flex-column justify-content-between me-2">
					<div>
						<input id="userId" name="userId" placeholder="ID">
					</div>
					<div>
						<input type="password" id="userPw" name="userPw" placeholder="PW">
					</div>
				</div>
				<div class="account_right d-flex flex-column justify-content-between">
					<div>
						<input type="submit" class="btn btn-light" value="로그인">
					</div>
					<div>
						<input type="button" class="btn btn-secondary" value="회원가입">
					</div>
				</div>
			</div>
			<div class="d-flex align-items-center">
				<input type="checkbox" name="saveId" id="saveId">
				<label for="saveId">아이디저장</label>
			</div>
		</form>
		<% } else { %>
		<div class="d-flex flex-column justify-content-between">
			<p class="mb-0 text-center"><%= memberLoggedIn.getUserId() %>님, 환영합니다:)</p>
			<div class="account_right d-flex justify-content-between" style="width:165px">
				<div>
					<input type="button" class="btn btn-light" value="마이페이지">
				</div>
				<div>
					<input type="button" class="btn btn-light" value="로그아웃">
				</div>
			</div>
		</div>
		<% } %>
	</div>
	<nav>
		<ul class="d-flex justify-content-center px-5 mb-0">
			<li class="nav-item fw-bolder mx-5">
				<a class="nav-link" href="#">HOME</a>
			</li>
			<li class="nav-item fw-bolder mx-5">
				<a class="nav-link" href="#">NOTICE</a>
			</li>
			<li class="nav-item fw-bolder mx-5">
				<a class="nav-link" href="#">BOARD</a>
			</li>
		</ul>
	</nav>
</header>
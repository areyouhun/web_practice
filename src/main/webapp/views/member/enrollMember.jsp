<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/head.jsp"%>
<title>회원가입</title>
<style>
	th, td {
		padding-bottom: 15px;
	}
	
	th {
		padding-right: 5px;
	}
	
	span.warning-absolute {
		position: absolute; 
		top: 10%; 
		left: 70%
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section id="enroll-container" class="d-flex flex-column align-items-center my-4">
		<h2 class="mb-4">회원 가입</h2>
		<form action="<%=request.getContextPath()%>/member/enrollMemberEnd.do" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" placeholder="4글자이상" name="userId" id="idToUse" duplicate="true"> 
						<input type="button" value="중복확인" onclick="validateIdDuplication();" class="btn btn-secondary py-1">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td style="position: relative">
						<input type="password" name="password" id="passwordToUse" onkeyup="validatePwLength(this);">
						<span class="warning-absolute"></span>
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td style="position: relative">
						<input type="password" id="passwordToConfirm" onkeyup="validatePwCorrectness(this);">
						<span class="warning-absolute"></span>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" id="userName"><br></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="number" name="age" id="age"><br></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" placeholder="abc@xyz.com" name="email" id="email"><br>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" placeholder="" name="address" id="address"><br>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" id="gender0" value="M"><label for="gender0">남</label> 
						<input type="radio" name="gender" id="gender1" value="F"><label for="gender1">여</label>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" id="hobby0" value="운동"><label for="hobby0">운동</label> 
						<input type="checkbox" name="hobby" id="hobby1" value="등산"><label for="hobby1">등산</label> 
						<input type="checkbox" name="hobby" id="hobby2" value="독서"><label for="hobby2">독서</label>
						<input type="checkbox" name="hobby" id="hobby3" value="게임"><label for="hobby3">게임</label> 
						<input type="checkbox" name="hobby" id="hobby4" value="여행"><label for="hobby4">여행</label>
					</td>
				</tr>
			</table>
			<div class="d-flex justify-content-center">
				<input type="submit" value="가입" onclick="return isAllValid();" class="btn btn-dark mx-1">
				<input type="reset" value="취소" class="btn btn-dark mx-1">
			</div>
		</form>
	</section>
<script>
	const isAllValid = () => {
		const idToUse = $('#idToUse');
		const passwordToUse = $('#passwordToUse').val();
		const passwordToConfirm = $('passwordToConfirm').val();
		
		if (idToUse.val().length < 4) {
			alert('아이디는 4글자 이상 입력하세요.');
			return false;
		}
		
		if (idToUse.attr('duplicate') == 'true') {
			alert('아이디 중복 검사를 통과하지 못 했습니다.');
			return false;
		}
		
		if (passwordToUse.length < 4) {
			alert('비밀번호는 4글자 이상 입력하세요.');
			return false;
		}
		
		if (passwordToUse !== passwordToConfirm) {
			alert('입력한 비밀번호가 일치하지 않습니다.');
			return false;
		}
	};
	
	const validateIdDuplication = () => {
		if ($('#idToUse').val().length < 4) {
			alert('아이디는 4글자 이상 입력하세요.');
			$('#idToUse').focus();
			return;
		} 
		
		window.open('<%= request.getContextPath() %>/member/idDuplicate.do?userId=' + $('#idToUse').val(), 
					'_blank',
					'width=300, height=200, left=200, top=200');
	};
	
	const insertMsg = (element, msg, color) => {
		$(element).text(msg).css('color', color);
	};
	
	const validatePwLength = (element) => {
		let color = '';
		let msg = '';
		
		if ($(element).val().length < 4) {
			msg = ' 4자 이상!';
			color = 'red';
			insertMsg($(element).next(), msg, color);
		}
		insertMsg($(element).next(), msg, color);
	};
	
	const validatePwCorrectness = (element) => {
		let msg = ' 일치';
		let color = 'green';
		
		if ($(element).val() != $('#passwordToUse').val()) {
			msg = ' 불일치';
			color = 'red';
			insertMsg($(element).next(), msg, color);
		} 
		insertMsg($(element).next(), msg, color);
	};
</script>
<%@ include file="/views/common/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<!-- id,pw,name,rrn,nick,gender,birth,tel,email -->
</head>

<body>
<div class="container">
<h1>회원가입</h1>
	<form action="write.do" method="post">
			<!-- 아이디 -->
			<div class="form-group">
				<label for="user_id">아이디</label>
					<input pattern="[A-Za-z][A-Za-z0-9]{2,19}" type="text" class="form-control" id="id" name="id" autocomplete="off" required="required" maxlength="20">
					<div id="checkId" class="alert alert-warning" >아이디는 4자 이상이여야 합니다.</div>
				</div>
				<div class="form-group" width=25;>
				<label for="pw">비밀번호</label>
				<input type="password" id="pw" name="pw" maxlength="20" class="form-control" required="required" width="25">
				<label for="pw" class="hidden">비밀번호 확인</label><br>
				<input type="password" id="pw2" name="pw2" maxlength="20" class="form-control" required="required" width="25">
			<div id="checkPw" class="alert alert-warning">비밀번호는 4자 이상이여야 합니다.
			</div>
			</div>
				<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" maxlength="20" class="form-control" autocomplete="off" required="required">
			</div>
<!-- 			<div class="form-group"> -->
<!-- 			<label for="name">주민등록번호</label><br> -->
<!-- 				<input type="RRN" id="RRN" name="RRN" size="6" maxlength="6" class="form-control" autocomplete="off" required="required" pattern="[0-9]+"> -->
<!-- 			<label for="RRN2" class="hidden">-</label> -->
<!-- 			<input type="RRN2" id="RRN2" name="RRN2" size="7" maxlength="7" class="form-control" autocomplete="off" required="required" pattern="{0-9]"> -->
<!-- 			</div> -->
			
				<div class="form-group">
				<label for="alias">닉네임</label>
				<input type="text" id="alias" name="alias" maxlength="20" class="form-control" autocomplete="off" required="required">
			</div>
				<div class="form-group">
				<label for="gender">성별</label><br>
					<select id="gender" name="gender" class="gender" required="required">
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
					</div>
				<div class="form-group">
				<label for="birth">생년월일</label><br>
					<input type="datetime" id="yy" name="birth" maxlength="4" class="form-control" placeholder="년(4자)" autocomplete="off" required="required" pattern="[0-9]+">
						<select id="mm" name="birth" class="sel">
							<option value="1">01</option>
							<option value="2">02</option>
							<option value="3">03</option>
							<option value="4">04</option>
							<option value="5">05</option>
							<option value="6">06</option>
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>							
							<select id="dd" name="birth" class="sel">
							<option value="1">01</option>
							<option value="2">02</option>
							<option value="3">03</option>
							<option value="4">04</option>
							<option value="5">05</option>
							<option value="6">06</option>
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
			</div>
			<div class="form-group">
				<label for="tel">전화번호</label><br>
					<select id="tel1" name="tel" class="class">
							<option selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
						</select>
					<input type="datetime" id="tel2" name="tel" size="4" maxlength="4" class="form-control" autocomplete="off" required="required" pattern="[0-9]+">
					<input type="datetime" id="tel3" name="tel" size="4" maxlength="4" class="form-control" autocomplete="off" required="required" pattern="[0-9]+">
				<div id="checkBt" class="alert alert-warning">전화번호를 정확하게 입력하세요.
				</div>
			</div>
			<div class="form-group">
				<label for="email">이메일</label><br>
				<input type="email" id="email" name="email" maxlength="20" class="form-control" autocomplete="off" required="required">
		</select>
			</div>
				<button id="writeBtn" class="writeBtn">가입하기</button>
		</form>
		</div>
		
</body>
</html>
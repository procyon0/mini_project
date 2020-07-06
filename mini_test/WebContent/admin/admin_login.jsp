<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인</title>
	<style>
	@import url('../css/admin_login.css')
	</style>
</head>
<body>
	<div class="wrap">
            <div class="form-wrap">
                <div class="social-icons">
                <br><br>
                    <img src="../img/logo_edited.jpg" alt="logo">
                </div>
                <form id="login" action="admin_login_process.jsp" class="input-group" method="POST">
                    <input type="text" class="input-field" placeholder="User name or Email" name="id" required>
                    <input type="password" class="input-field" placeholder="Enter Password" name="pwd" required>
                    <br><br><br><br><br>
                    <button class="submit">Login</button>
                </form>
            </div>
        </div>
</body>
</html>
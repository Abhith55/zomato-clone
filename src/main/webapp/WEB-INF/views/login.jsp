<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-default.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/alert.css" />
    <script src="${pageContext.request.contextPath}/js/alert.js"></script>

</head>
<body class="login-body">

<%@ include file="layout/header-login.jsp" %>

<div class="login-container">
    <div id="errorMsg" style="color: red; margin-top: 10px;"></div>

    <div class="login-box">
        <h2>Login to Zomtao</h2>

        <form id="loginForm">
            <input type="text" name="username" placeholder="👤 Username" class="form-control" required />
            <input type="password" name="password" placeholder="🔒 Password" class="form-control" required />
            <button type="submit" class="btn-login">Login</button>
        </form>
    </div>
</div>
<div id="customAlert" class="custom-alert" style="display:none;"></div>

<%@ include file="layout/footer-login.jsp" %>

<script>
    $("#loginForm").submit(function(e) {
    e.preventDefault();

    const loginData = {
        username: $("input[name='username']").val(),
        password: $("input[name='password']").val()
    };

    $.ajax({
        url: "${pageContext.request.contextPath}/api/login",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(loginData),
        success: function(response) {
            showAlert("✅ Login successful! Redirecting...", "success");

            if (response.role === 'ADMIN') {
                setTimeout(function () {
                    window.location.href = "${pageContext.request.contextPath}/main";
                }, 1500);
            }

            // Restaurant Owner ke liye: first call to 8081 to create session
            else if (response.role === 'RESTAURANT_OWNER') {
                $.ajax({
                    url: "http://localhost:8081/api/session",
                    type: "POST",
                     contentType: "application/json",
    data: JSON.stringify(
        { username: response.userName
        }),
                 success: function () {
                        setTimeout(function () {
                           window.open("http://localhost:8081/home", "_blank");
                        }, 1000);
                    },
                    error: function () {
                        showAlert("❌ Failed to sync session with Restaurant Portal.", "error");
                    }
                });
            }
        },
        error: function() {
            showAlert("❌ Invalid username or password.", "error");
        }
    });
});

</script>

</body>
</html>

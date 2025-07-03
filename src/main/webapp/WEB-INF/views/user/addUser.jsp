<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header-dashboard.jsp" %>
<%@ include file="../layout/sidebar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardheader.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css" />
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alert.css" />

    <!-- Scripts-->
    <script src="${pageContext.request.contextPath}/js/alert.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/admin.js"></script>

 
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f5f7fa;
    margin: 0;
    padding: 0;
}

.content-area {
    margin-left: 220px;
    padding: 60px 20px 80px 20px;
    min-height: 100vh;
    box-sizing: border-box;
}

.user-form {
    background: white;
    max-width: 700px;
    margin: 0 auto;
    padding: 40px 30px;
    border-radius: 12px;
    box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
    margin-top: 10px;
}

.user-form h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-size: 24px;
}

.material-input {
    position: relative;
    margin-bottom: 24px;
}

.material-input input,
.material-input select {
    width: 92%;
    border: none;
    border-bottom: 2px solid #ccc;
    padding: 10px 10px 10px 40px;
    font-size: 16px;
    background: transparent;
    outline: none;
    transition: all 0.3s ease;
}

.material-input input:focus,
.material-input select:focus {
    border-color: #3f51b5;
}

.material-input label {
    position: absolute;
    left: 40px;
    top: -8px;
    font-size: 12px;
    background: white;
    padding: 0 4px;
    color: #3f51b5;
    font-weight: 500;
}

.material-input .material-icons {
    position: absolute;
    top: 12px;
    left: 10px;
    color: #999;
}

.btn-login {
    width: 100%;
    background: #3f51b5;
    color: white;
    padding: 14px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s;
    margin-top: 10px;
}

.btn-login:hover {
    background: #2c3ea7;
}

@media (max-width: 768px) {
    .content-area {
        margin-left: 0;
        padding: 40px 15px 60px 15px;
    }

    .user-form {
        padding: 30px 20px;
    }
}
</style>
<div class="content-area">
<div class="user-form">
       <div id="errorMsg" style="color: red; margin-top: 10px;"></div> 

  <h2><i class="material-icons">person_add</i> Add New User</h2>

    <form id = "userform" action="${pageContext.request.contextPath}/user/save" method="post">

        <div class="material-input">
            <i class="material-icons">person</i>
            <label>Owner Name</label>
            <input type="text" name="ownerName"  id= "ownerName"    required />
        </div>
<div class="material-input">
    <i class="material-icons">store</i>
    <label>Restaurant Name</label>
    <input type="text" name="restaurentName" required 
           lang="auto"   placeholder="रेस्टोरेंट का नाम / Restaurant Name 🍽️"   id="restaurentName" inputmode="text" pattern=".*" />
</div>

        <div class="material-input">
            <i class="material-icons">calendar_today</i>
            <label>Registration Date</label>
            <input type="date" name="registrationDate"  id="registrationDate" value="<%= java.time.LocalDate.now()
            
            %>" readonly />
        </div>

        <div class="material-input">
            <i class="material-icons">map</i>
            <label>State</label>
            <input type="text" name="state" id="state" required />
        </div>


        
        <div class="material-input">
            <i class="material-icons">location_city</i>
            <label>City</label>
            <input type="text" name="city"  id="city" required />
        </div>

        <div class="material-input">
            <i class="material-icons">credit_card</i>
            <label>PAN or Aadhaar Card</label>
            <input type="text" name="panorAddharCard"  id="panorAddharCard" required />
        </div>

        <div class="material-input">
            <i class="material-icons">account_circle</i>
            <label>Username</label>
            <input type="text" name="username" id="username" required />
        </div>

        <div class="material-input">
            <i class="material-icons">lock</i>
            <label>Password</label>
            <input type="password" name="password"  id="password" required />
        </div>

        <div class="material-input">
            <i class="material-icons">email</i>
            <label>Email (Optional)</label>
            <input type="email" name="email"  id="email" />
        </div>

        <div class="material-input">
            <i class="material-icons">verified_user</i>
            <label>Role</label>
            <select name="role" id="verified_user" required>
                <option value="">-- Select Role --</option>
                <option value="RESTAURANT_OWNER">Restaurant Owner</option>
            </select>
        </div>

        <button type="submit" class="btn-login">➕ Add User</button>
    </form>
</div>
</div>
<div id="customAlert" class="custom-alert" style="display:none;"></div>

<script>
    $("#userform").submit(function(e) {
        e.preventDefault();

        const userData = {
            ownerName: document.getElementById("ownerName").value,
            restaurentName:document.getElementById("restaurentName").value,
            registrationDate:document.getElementById("registrationDate").value,
            state:document.getElementById("state").value,
            city:document.getElementById("city").value,
            panorAddharCard:document.getElementById("panorAddharCard").value,
            username:document.getElementById("username").value,
            password:document.getElementById("password").value,
            email:document.getElementById("email").value,
            role:document.getElementById("verified_user").value
        };

        $.ajax({
            url: "${pageContext.request.contextPath}/api/users/register",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(userData),
            success: function(response) {
                 showAlert("✅ User added Suceessfully", "success");
                setTimeout(function() {
                window.location.href = "${pageContext.request.contextPath}/user/add";
            }, 2000);

            },
           error: function() {
    showAlert("❌ User not added Please check!..", "error");
}
        });
    });
</script>

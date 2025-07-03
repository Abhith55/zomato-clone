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

.menu-form {
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
  }
@media (max-width: 768px) {
    .menu-form {
        padding: 30px 20px;
    }
}

</style>


<div class="content-area">
<div class="menu-form">
    <h2><i class="material-icons">menu</i> Add Menu</h2>
    
    <div class="material-input">
        <i class="material-icons">person</i>
        <label for="userId">Restaurant Owner</label>
        <select id="userId" name="userId" required></select>
    </div>

    <div class="material-input">
        <i class="material-icons">title</i>
        <label for="title">Menu Title</label>
        <input type="text" id="title" name="title" placeholder="e.g. Breakfast Menu 🍳" required />
    </div>

    <button id="saveMenuBtn" class="btn-login">➕ Add Menu</button>
</div>

</div>
<div id="customAlert" class="custom-alert" style="display:none;"></div>

<script>
$(document).ready(function () {
    // Load dropdown
    $.get("${pageContext.request.contextPath}/api/users", function (data) {
        let dropdown = $("#userId");
        dropdown.append(`<option value="">-- Select Owner --</option>`);
        data.forEach(function (user) {
          console.log(user);
                  if (user.role === "RESTAURANT_OWNER") {
            dropdown.append(`<option value="\${user.uid}">\${user.restaurentName} (\${user.ownerName})</option>`);
      }
      });
    });
  });
<!-- end of ready function-->
$("#saveMenuBtn").click(function () {
  console.log("finction called")
  debugger
  console.log("Selected userId:", userId);
    const menuData = {
        userId: $("#userId").val(),
        title: $("#title").val()
    };

    $.ajax({
        url: "${pageContext.request.contextPath}/api/users/addMenu",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(menuData),
        success: function() {
            showAlert("✅ Menu added successfully", "success");
             setTimeout(function() {
                window.location.href = "${pageContext.request.contextPath}/menus/add";
            }, 2000);
            $("#saveMenuBtn")[0].reset();
        },
        error: function() {
            showAlert("❌ Failed to add menu", "error");
        }
    });

  });


</script>
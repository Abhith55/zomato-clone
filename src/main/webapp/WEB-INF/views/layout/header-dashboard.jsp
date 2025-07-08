<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Zomtao Header</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alert.css" />

    <!-- Scripts-->
    <script src="${pageContext.request.contextPath}/js/alert.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="simple-header">
  <div class="left-logo">
      <img src="${pageContext.request.contextPath}/images/logo.png" class="logo-img" alt="Zomtao Logo" />
      <span class="brand-name">Zomtao Admin</span>
  </div>

  <div class="right-profile">
      <div class="profile-icon" id="profileToggle">👤</div>
      <div class="profile-dropdown" id="profileDropdown">
          <ul>
              <li><a href="#">👤 Profile</a></li>
             <li><a href="javascript:void(0);" onclick="logoutUser()">🚪 Logout</a></li>
          </ul>
      </div>
  </div>
</div>
<script>
function logoutUser() {
  $.ajax({
    url: '${pageContext.request.contextPath}/api/login/logout',
    type: 'POST',
    success: function () {
      showAlert("✅ User logged out successfully.", "success");
      setTimeout(function () {
        window.location.href = '${pageContext.request.contextPath}/login';
      }, 2000); // Delay before redirect
    },
    error: function (xhr, status, error) {
      console.error("Logout Error:", error);
      showAlert("❌ Logout request failed: " + error, "error");
    }
  });
}

</script>
</body>
</html>

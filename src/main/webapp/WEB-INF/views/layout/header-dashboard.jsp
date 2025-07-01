<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Zomtao Header</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
              <li><a href="${pageContext.request.contextPath}/logout">🚪 Logout</a></li>
          </ul>
      </div>
  </div>
</div>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Zomtao Admin Panel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardheader.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css" />

  
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>

<style>
.content-area {
    margin-left: 220px;
    margin-top: 60px;
    padding: 20px;
}
</style>


</head>


<body class="main-body">

  <!-- ✅ Remove this line -->
<%@ include file="layout/header-dashboard.jsp" %>

  <div class="main-layout">
  
  <%@ include file="layout/sidebar.jsp" %>

  <div class="content-area">
    <h2>Welcome to Zomtao Admin Panel 🍽️</h2>
    <p>This is your dashboard. Use the sidebar to navigate.</p>
  </div>

</div>

</body>
</html>

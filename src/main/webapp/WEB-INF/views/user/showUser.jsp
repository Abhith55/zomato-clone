<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header-dashboard.jsp" %>
<%@ include file="../layout/sidebar.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardheader.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/admin.js"></script>

  <script>
$(document).ready(function () {
    $.ajax({
        url: "${pageContext.request.contextPath}/api/users",
        type: "GET",
        success: function (users) {
          console.log("User Data ===>", users); 
            let html = "";
            users.forEach(function (user, index) {
                html += `
                    <tr>
                        <td>\${index + 1}</td>
                        <td>\${user.ownerName}</td>
                        <td>\${user.restaurentName}</td>
                        <td>\${user.state}</td>
                        <td>\${user.city}</td>
                        <td>\${user.username}</td>
                        <td>\${user.role}</td>
                        <td>
                            <button class="action-btn" onclick="toggleUser(${user.uid}, this)">
                                ${user.active ? 'Deactivate' : 'Activate'}
                            </button>
                            <button class="action-btn" onclick="editUser(${user.uid})">Edit</button>
                        </td>
                    </tr>
                `;
            });
            $("#userTableBody").html(html);
        },
        error: function () {
            $("#userTableBody").html("<tr><td colspan='8'>❌ No user found</td></tr>");
        }
    });
});

function toggleUser(uid, btn) {
    // Placeholder toggle logic
    const currentStatus = btn.innerText.trim();
    btn.innerText = currentStatus === "Activate" ? "Deactivate" : "Activate";
    alert("User " + uid + " toggled (" + btn.innerText + ")");
}

function editUser(uid) {
    window.location.href = "${pageContext.request.contextPath}/user/edit/" + uid;
}
</script>


<style>
.content-area {
    margin-left: 220px;
    padding: 40px 20px;
    min-height: 100vh;
    box-sizing: border-box;
    background-color: #f0f2f5;
    font-family: 'Roboto', sans-serif;
}
.table-container {
    background: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    overflow-x: auto;
}
table {
    width: 100%;
    border-collapse: collapse;
    font-size: 15px;
}
thead {
    background-color: #3f51b5;
    color: white;
}
thead th {
    padding: 12px;
    text-align: left;
}
tbody td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}
.action-btn {
    background-color: #3f51b5;
    border: none;
    color: white;
    padding: 6px 12px;
    margin-right: 5px;
    border-radius: 6px;
    cursor: pointer;
    transition: 0.2s;
}
.action-btn:hover {
    background-color: #2c3ea7;
}
</style>

<div class="content-area">
    <div class="table-container">
        <h2><i class="material-icons">groups</i> All Users</h2>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Owner</th>
                    <th>Restaurant</th>
                    <th>State</th>
                    <th>City</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <!-- Rows loaded dynamically via AJAX -->
            </tbody>
        </table>
    </div>
</div>


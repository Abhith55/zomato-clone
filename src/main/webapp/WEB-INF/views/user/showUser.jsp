<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ include
file="../layout/header-dashboard.jsp" %> <%@ include
file="../layout/sidebar.jsp" %>

<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/css/dashboardheader.css"
/>
<link
  rel="stylesheet"
  href="${pageContext.request.contextPath}/css/sidebar.css"
/>
<link
  href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet"
/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alert.css" />

    <!-- Scripts-->
    <script src="${pageContext.request.contextPath}/js/alert.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/admin.js"></script>

<script>
  let currentPage = 0;
  let searchQuery = "";
  $(document).ready(() => {
    fetchUsers(); // Default page 0
    $("#firstBtn").click(() => {
      currentPage = 0;
      fetchUsers(currentPage);
    });
    $("#prevBtn").click(() => {
      if (currentPage > 0) {
        currentPage--;
        fetchUsers(currentPage);
      }
    });
    $("#nextBtn").click(() => {
      console.log("next called");

      console.log("next called" + searchQuery);
      currentPage++;
      fetchUsers(currentPage);
    });
    $("#lastBtn").click(() => {
      $.ajax({
        url: `${pageContext.request.contextPath}/api/users/getUser?page=0&size=10&query=\${searchQuery}`,
        success: (res) => {
          const totalPages = res.totalPages;
          currentPage = totalPages - 1;
          fetchUsers(currentPage); // Now this will have full content + totalPages
        },
      });
    });
    $("#pageInput").keydown((e) => {
      if (e.key === "Enter" || e.keyCode === 13) {
        const pageNum = parseInt($("#pageInput").val()) - 1;
        if (pageNum >= 0) {
          currentPage = pageNum;
          fetchUsers(currentPage);
          $("#pageInput").blur(); // Remove focus
        }
      }
    });
    $("#goBtn").click(() => {
      const pageNum = parseInt($("#pageInput").val()) - 1;
      if (pageNum >= 0) {
        currentPage = pageNum;
        fetchUsers(currentPage);
      }
    });
    $("#userSearchInput").on("input", function () {
      searchQuery = $(this).val().trim();
      console.log(searchQuery);
      currentPage = 0;
      fetchUsers(currentPage);
    });
  });
  function fetchUsers(page = 0, size = 10) {
    $.ajax({
      url: `${contextPath}/api/users/getUser?page=\${page}&size=\${size}&query=\${searchQuery}`,
      method: "GET",
      success: function (response) {
        const users = response.content;
        const totalPages = response.totalPages;
        renderTable(users);
        renderPagination(page, totalPages);
      },
      error: function () {
        $("#userTableBody").html(
          "<tr><td colspan='8'>❌ No user found</td></tr>"
        );
      },
    });
  }
  function renderTable(users) {
    let html = "";
    users.forEach((user, index) => {
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
      <button class="action-btn" onclick="toggleUser(\${user.uid}, this)">
  \${user.status === 2 ? "Deactivate" : "Activate"}
</button>    <button class="action-btn" onclick="editUser(${user.uid})">Edit</button>
        </td>
      </tr>`;
    });
    $("#userTableBody").html(html);
  }

  function renderPagination(current, totalPages) {
    $("#pageInput").val(current + 1);
    $("#totalPages").text(totalPages);
     $("#prevBtn").prop("disabled", current == 0);
    $("#nextBtn").prop("disabled", current == totalPages - 1);
  }

  function toggleUser(uid, btn) {
    // Placeholder toggle logicci
    const currentStatus = btn.innerText.trim();
    let status = "";
   let message = "";
    if (currentStatus == "Activate") {
      status = 2;
              message = "✅ User Status changed: Active ➡️ Deactivated";
    } else {
      status = 1;
      message = "✅ User Status changed: Deactivated ➡️ Activated";

    }
    console.log("Current status" + status + " Uid" + uid);
    // status update ajax  ui anu
    const userData = {
      uid: uid,
      status: status,
    };
    $.ajax({
      url: "${pageContext.request.contextPath}/api/users/changeStatus",
      type: "POST",
      contentType: "application/json",
      data: JSON.stringify(userData),

      success: function (response) {
        console.log("✅ Response from server:", response);

        showAlert(message, "success");
        btn.innerText =
          currentStatus === "Activate" ? "Deactivate" : "Activate";
      },
      error: function () {
        showAlert("❌ User stauts not change Please check!..", "error");
      },
    });
  }

  function editUser(uid) {
    window.location.href =
      "${pageContext.request.contextPath}/user/edit/" + uid;
  }
</script>

<style>
  .content-area {
    margin-left: 220px;
    padding: 40px 20px;
    min-height: 100vh;
    box-sizing: border-box;
    background-color: #f0f2f5;
    font-family: "Roboto", sans-serif;
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
    padding: 4px 10px;
    font-size: 13px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.25s ease, transform 0.15s ease;
  }

  .action-btn:hover {
    background-color: #2c3ea7;
    transform: scale(1.05); /* Slight grow on hover */
  }

  .action-btn:active {
    transform: scale(0.95); /* Shrink on click */
  }
  .search-bar {
    display: flex;
    align-items: center;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 8px 12px;
    margin-bottom: 20px;
    max-width: 400px;
  }
  .search-bar input {
    border: none;
    outline: none;
    width: 100%;
    font-size: 14px;
  }
  .search-icon {
    color: #3f51b5;
    margin-right: 8px;
  }

  .pagination-bar {
    margin-top: 20px;
    display: flex;
    justify-content: flex-end; /* Right aligned */
    flex-wrap: wrap;
    gap: 6px;
    align-items: center;
    padding: 10px 0;
  }

  .page-btn.active {
    background-color: #2c3ea7 !important;
    font-weight: bold;
    pointer-events: none;
  }
  #pageInput {
    width: 45px;
    text-align: center;
    padding: 4px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 13px;
  }

  @media (max-width: 600px) {
    .pagination-bar {
      flex-direction: column;
      align-items: stretch;
    }
    .pagination-bar span {
      flex-wrap: wrap;
      justify-content: center;
    }
  }

@media (max-width: 600px) {
  table {
    font-size: 13px;
  }

  thead th,
  tbody td {
    padding: 8px;
  }
}
</style>
<div class="content-area">
  <div class="table-container">
    <h2><i class="material-icons">groups</i> All Users</h2>
    <div class="search-bar">
      <i class="material-icons search-icon">search</i>
      <input
        type="text"
        id="userSearchInput"
        placeholder="Search by Owner, Username,PanorAddharCard  ..."
      />
    </div>
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
    <div class="pagination-bar">
      <button class="action-btn" id="firstBtn">⏮ First</button>
      <button class="action-btn" id="prevBtn">⬅ Prev</button>

      <span style="display: flex; align-items: center; gap: 6px">
        Page
        <input
          type="number"
          id="pageInput"
          value="1"
          min="1"
          style="width: 50px; text-align: center; padding: 4px 6px"
        />
        of <span id="totalPages">10</span>
        <button class="action-btn" id="goBtn">Go</button>
      </span>

      <button class="action-btn" id="nextBtn">Next ➡</button>
      <button class="action-btn" id="lastBtn">⏭ Last</button>
    </div>
  </div>
</div>
<div id="customAlert" class="custom-alert"></div>

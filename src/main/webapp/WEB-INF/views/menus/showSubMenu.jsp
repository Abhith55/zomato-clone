<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ include
file="../layout/header-dashboard.jsp" %> <%@ include
file="../layout/sidebar.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardheader.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css"/>
    <link
      rel="stylesheet" href="${pageContext.request.contextPath}/css/alert.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/emojis.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/alert.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin.js"></script>
    <title>Admin Panel</title>
    <style>
      .content-area {
        margin-left: 220px;
        padding: 60px 20px;
        background-color: #f5f7fa;
        min-height: 100vh;
      }
      .menu-wrapper {
        max-width: 1100px;
        margin: auto;
        background: #fffbe7;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1);
      }
      .menu-header {
        text-align: center;
        margin-bottom: 20px;
      }
      #restaurantDropdown {
        padding: 10px;
        width: 100%;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 16px;
        margin-top: 10px;
      }
      .menu-list {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 15px;
      }
      .menu-item {
        background: white;
        padding: 12px 16px;
        border-radius: 6px;
        border: 1px solid #ddd;
        cursor: pointer;
        font-weight: bold;
        color: #4e342e;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: background 0.2s ease;
      }
      .menu-item:hover {
        background: #fff3e0;
      }
      .submenu-wrapper {
        grid-column: span 3;
        display: none;
        animation: fadeIn 0.3s ease;
      }
      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: scaleY(0.95);
        }
        to {
          opacity: 1;
          transform: scaleY(1);
        }
      }
      .submenu-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
        margin-top: 10px;
      }
      .submenu-table th,
      .submenu-table td {
        padding: 8px 10px;
        border: 1px solid #ccc;
      }
      .submenu-table th {
        background-color: #ffecb3;
      }
    </style>
    <script>
      $(document).ready(function () {
        // Load dropdown
        $.get("${pageContext.request.contextPath}/api/users", function (data) {
          data.forEach(function (user) {
            if (user.role === "RESTAURANT_OWNER") {
              $("#restaurantDropdown").append(
                `<option value="\${user.uid}">\${user.restaurentName} (\${user.ownerName})</option>`
              );
            }
          });
        });
        $("#restaurantDropdown").change(function () {
          const userId = $(this).val();
          if (!userId) {
            $("#menuList").html("");
            return;
          }
          $("#menuList").html("⏳ Loading menus...");
          $.get(
            `${pageContext.request.contextPath}/api/users/\${userId}`,
            function (menus) {
              if (menus.length === 0) {
                $("#menuList").html(
                  `<div style="color:red;">❌ No menus found.</div>`
                );
                return;
              }
              let html = "";
              menus.forEach((menu) => {
                const emoji = getEmojiFromTitle(menu.title);
                html += `
              <div class="menu-item" onclick="toggleSubmenu(\${menu.id})" , \${userId})"   id="menu-\${menu.id}">
                \${emoji} \${menu.title}
              </div>
              <div class="submenu-wrapper" id="submenu-\${menu.id}">
                <table class="submenu-table">
                  <thead>
                    <tr><th>Sr No</th><th>Name</th><th>Price</th></tr>
                  </thead>
                 <tbody id="submenu-body-\${menu.id}">
              <!-- Submenus will load here dynamically -->
              <tr><td colspan="3">🔄 Loading...</td></tr>
            </tbody>
                </table>
              </div>
            `;
              });

              $("#menuList").html(html);
            }
          );
        });
      });
      function toggleSubmenu(menuId) {
        const submenuDiv = $(`#submenu-\${menuId}`);
        $(".submenu-wrapper").not(submenuDiv).slideUp();
        if (submenuDiv.is(":visible")) {
          submenuDiv.slideUp();
          return;
        }
        submenuDiv.slideDown();
        const userId = $("#restaurantDropdown").val();
        const tbody = $(`#submenu-body-\${menuId}`);
        // Show loading message
        tbody.html(`<tr><td colspan="3">🔄 Loading...</td></tr>`);
        // Fetch submenu items
        $.get(
          `${pageContext.request.contextPath}/api/subMenus/shows/\${userId}/\${menuId}`,
          function (submenus) {
            if (!Array.isArray(submenus) || submenus.length === 0) {
              tbody.html(
                `<tr><td colspan="3" style="color:red;">❌ No submenus found</td></tr>`
              );
              return;
            }
            let rows = "";
            submenus.forEach((item, index) => {
              const emoji = getEmojiFromTitle(item.title);
              rows += `<tr><td>${
                index + 1
              }</td><td>\${emoji}\${item.title}</td><td>₹\${item.price}</td></tr>`;
            });

            tbody.html(rows);
          }
        );
      }
      function getEmojiFromTitle(title) {
        title = title.toLowerCase();
        for (let keyword in emojiMap) {
          if (title.includes(keyword)) {
            return emojiMap[keyword];
          }
        }
        return "🍽️"; // default
      }
    </script>
  </head>
  <body>
    <div class="content-area">
      <div class="menu-wrapper">
        <div class="menu-header">
          <h2><i class="material-icons">restaurant_menu</i> Show SubMenus</h2>
          <select id="restaurantDropdown">
            <option value="">-- Select Restaurant --</option>
          </select>
        </div>

        <div class="menu-list" id="menuList">
          <!-- Menus load here -->
        </div>
      </div>
      <div id="customAlert" class="custom-alert" style="display: none"></div>
    </div>
  </body>
</html>

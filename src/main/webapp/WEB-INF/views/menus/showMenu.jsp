<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header-dashboard.jsp" %>
<%@ include file="../layout/sidebar.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardheader.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alert.css" />

    <!-- Scripts-->
    <script src="${pageContext.request.contextPath}/js/alert.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/admin.js"></script>


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
    padding: 20px;
    background: #fffbe7;
    border-radius: 12px;
    box-shadow: 0 6px 24px rgba(0,0,0,0.1);
}

.menu-header {
    text-align: center;
    margin-bottom: 30px;
}

.menu-header h2 {
    font-family: 'Georgia', serif;
    color: #3e2723;
}

#restaurantDropdown {
    padding: 10px;
    width: 100%;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 16px;
}

.menu-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
}

.menu-card {
    background: #fff;
    border-radius: 12px;
    padding: 20px;
    border: 1px solid #e0e0e0;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    position: relative;
}

.menu-card h3 {
    font-size: 20px;
    color: #5d4037;
    margin-bottom: 10px;
}

.menu-card p {
    font-size: 15px;
    color: #6d4c41;
    margin-bottom: 8px;
}

.menu-card .price {
    font-size: 16px;
    font-weight: bold;
    color: #ff5722;
}

.card-actions {
    display: flex;
    gap: 10px;
    margin-top: 15px;
}

.card-actions button {
    padding: 6px 12px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
}

.edit-btn {
    background: #0288d1;
    color: white;
}

.delete-btn {
    background: #e53935;
    color: white;
}

@media (max-width: 768px) {
    .content-area {
        margin-left: 0;
        padding: 20px;
    }

    .menu-grid {
        grid-template-columns: 1fr !important;
    }

    .card-actions {
        flex-direction: column;
    }

    .card-actions button {
        width: 100%;
        margin-bottom: 8px;
    }

}


</style>

<div class="content-area">
  <div class="menu-wrapper">
    <div class="menu-header">
      <h2><i class="material-icons">restaurant_menu</i> Show Menus</h2>
      <select id="restaurantDropdown">
        <option value="">-- Select Restaurant --</option>
      </select>
    </div>

    <div class="menu-grid" id="menuGrid">
      <!-- Menus will be loaded here -->
    </div>
  </div>
  
<div id="customAlert" class="custom-alert" style="display:none;"></div>

</div>
<%@ include file="../menus/SubMenuModal.jsp" %>

<script>
$(document).ready(function () {
    // 1. Load dropdown
    $.get("${pageContext.request.contextPath}/api/users", function (data) {
        data.forEach(function (user) {
            if (user.role === "RESTAURANT_OWNER") {
                $("#restaurantDropdown").append(
                    `<option value="\${user.uid}">\${user.restaurentName} (\${user.ownerName})</option>`
                );
            }
        });
    });

    // 2. Handle dropdown change
    $("#restaurantDropdown").change(function () {
        const userId = $(this).val();

        if (!userId) {
            $("#menuGrid").html(`<div style="text-align:center; padding:20px; color:orange;">
                ⚠️ Please select a restaurant first.
            </div>`);
            return;
        }

        $("#menuGrid").html(`<div style="text-align:center; padding:20px;">⏳ Loading menus...</div>`);

        // 3. Load Menus by User
        $.get(`${pageContext.request.contextPath}/api/users/\${userId}`, function (menus) {
            let html = "";
  console.log(menus);
            if (menus.length === 0) {
                html = `<div style="text-align:center; padding:20px; color:red;">
                          ❌ No menus found for this restaurant.
                        </div>`;
            } else {
                menus.forEach(menu => {
                    html += `
                        <div class="menu-card" id="menu-card-\${menu.id}">
                            <h3>🍽️ \${menu.title}</h3>
                            <div class="card-actions">
                                <button class="edit-btn" onclick="editMenu(\${menu.id})">Edit</button>
                                <button class="delete-btn" onclick="deleteMenu(\${menu.id})">Delete</ button>
                                      <button class="edit-btn" onclick="openSubmenuModal(\${menu.id}, '\${menu.title}', \${menu.userId})">➕ Add Submenu</button>
                                </div>
                            


                        </div>
                    `;
                });
            }

            $("#menuGrid").html(html);
        }).fail(function () {
            $("#menuGrid").html(`<div style="text-align:center; padding:20px; color:red;">
                ❌ Failed to load menus. Please try again later.
            </div>`);
        });
    });
});

// Optional placeholder functions
function editMenu(menuId) {
    alert("Edit menu ID: " + menuId);
}

function deleteMenu(menuId) {
    if (confirm("Are you sure you want to delete this menu?")) {
        // Call delete API (implement as needed)
        alert("Deleted menu ID: " + menuId);
    }
}



function openSubmenuModal(menuId, menuTitle,userId) {
    debugger
   $("#modalMenuId").val(menuId);
  $("#modalUserId").val(userId); 
 
  
      console.log(userId);

  $("#modalMenuTitle").text(menuTitle);
    $("#submenuInputs").html(`
    <div class="submenu-row">
      <input type="text" class="submenu-input" placeholder="Enter Submenu Title" />
      <input type="text" class="submenu-input" placeholder="Enter Price" />
    </div>
  `);
  $("#submenuModal").show();
}

function closeSubmenuModal() {
  $("#submenuModal").hide();
  
}function addMoreSubmenuField() {
  $("#submenuInputs").append(`
    <div class="submenu-row">
      <input type="text" class="submenu-input" placeholder="Enter Submenu Title" />
      <input type="text" class="submenu-input" placeholder="Enter Price" />
      <span class="material-icons remove-icon" onclick="removeSubmenuRow(this)">remove</span>
    </div>
  `);
}

function removeSubmenuRow(element) {
  $(element).closest('.submenu-row').remove();
}
function submitSubmenus() {
    debugger
  const menusId = $("#modalMenuId").val();
  console.log(menusId);
  const userId = $("#modalUserId").val();
  console.log(userId);
   if (!menusId || !userId) {
    showAlert("❌ Something went wrong. Menu or User ID is missing.", "error");
    return;
  }

  const submenus = [];

  $("#submenuInputs .submenu-row").each(function () {
    const title = $(this).find("input").eq(0).val().trim();
    const price = $(this).find("input").eq(1).val().trim();

    if (title !== "") {
      submenus.push({
        title: title,
        price: price,
        menusId: menusId,
        userId: userId
      });
    }
  });

  if (submenus.length === 0) {
    showAlert("❌ Please enter at least one submenu.", "error");
    return;
  }

  $.ajax({
    url: `${pageContext.request.contextPath}/api/subMenus/add`,
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(submenus), // ✅ Send list directly
    success: function () {
      showAlert("✅ Submenus added successfully!","success");
      closeSubmenuModal();
    },
    error: function () {
      showAlert("❌ Failed to add submenus.","error");
    }
  });
}

</script>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
  <ul class="sidebar-nav">
<li class="sidebar-item">
      <a href="javascript:void(0);" onclick="location.href='${pageContext.request.contextPath}/main'">  📊 Dashboard</a>
    </li>
     <li class="sidebar-item">
      <a href="javascript:void(0);" class="has-submenu">👤 User Management</a>
      <ul class="submenu">
        <li>
          <a href="javascript:void(0);" onclick="location.href='${pageContext.request.contextPath}/user/add'">➕ Add User</a>
        </li>
        <li>
  <a href="javascript:void(0);" onclick="location.href='${pageContext.request.contextPath}/user'">📄 Show Users</a>
</li>
      </ul>
    </li>
    <li class="sidebar-item">
      <a href="javascript:void(0);" class="has-submenu">📋 Menu Management</a>
      <ul class="submenu">
        <li>
          <a href="${pageContext.request.contextPath}/menus/add"
            >➕ Add Menu
          </a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/menus/show">📄 Show Menu</a>
        </li>
      </ul>
    </li>
    <li class="sidebar-item">
      <a href="javascript:void(0);" class="has-submenu">📋 SubMenu Management </a>
      <ul class="submenu">
        <li>
          <a href="${pageContext.request.contextPath}/menus/SubMenu">📄 Show Menu</a>
        </li>
      </ul>
    </li>
  </ul>
</div>

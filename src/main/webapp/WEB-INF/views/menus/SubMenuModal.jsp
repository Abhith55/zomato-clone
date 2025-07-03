<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
.modal {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.modal-content {
  background: white;
  padding: 20px;
  border-radius: 12px;
  width: 90%;
  max-width: 500px;
  max-height: 90vh;        /* Set maximum height based on viewport */
  overflow-y: auto;        /* Allow vertical scrolling */
  position: relative;
}

.modal {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  overflow-y: auto;  /* In case content goes below viewport */
  padding: 20px;
}



.close-btn {
  position: absolute;
  right: 20px;
  top: 15px;
  font-size: 22px;
  cursor: pointer;
}

.submenu-input {
  width: 100%;
  padding: 10px;
  margin-top: 10px;
  border-radius: 6px;
  border: 1px solid #ccc;
   margin-left: -10px;
}

.add-more-btn, .save-btn {
  padding: 10px 16px;
  border: none;
  background: #3f51b5;
  color: white;
  border-radius: 8px;
  cursor: pointer;
  margin-top: 10px;
}


</style>


<!-- Submenu Modal -->
<div id="submenuModal" class="modal" style="display:none;">
  <div class="modal-content">
    <span class="close-btn" onclick="closeSubmenuModal()">×</span>
    <h3>Add Submenus for <span id="modalMenuTitle"></span></h3>
    
    <input type="hidden" id="modalMenuId" />

    <div id="submenuInputs">
      <input type="text" class="submenu-input" placeholder="Enter Submenu Title" />
    </div>

    <button onclick="addMoreSubmenuField()" class="add-more-btn">➕ Add More</button>
    <br><br>
     <div style="position: sticky; bottom: 0; background: white; padding-top: 10px;">
    <button onclick="submitSubmenus()" class="save-btn">✅ Save Submenus</button>
  </div>
  </div>
</div>
  $(document).ready(function () {
     
    // Toggle profile dropdown
      $("#profileToggle").on("click", function (e) {
          e.stopPropagation(); // 🛑 Prevent bubble to document
          $("#profileDropdown").fadeToggle(200);
      });

      // Prevent dropdown itself from closing when clicking inside it
      $("#profileDropdown").on("click", function (e) {
          e.stopPropagation();
      });

      // Close dropdown when clicking outside
      $(document).on("click", function () {
          $("#profileDropdown").fadeOut(200);
      });
  });
    $(document).ready(function () {
    $(".has-submenu").on("click", function () {
      const parent = $(this).closest(".sidebar-item");
      parent.toggleClass("active");
      parent.find(".submenu").slideToggle(200);
    });
  });

function showAlert(message, type) {
    const alertBox = $("#customAlert");
    alertBox.text(message).removeClass().addClass("custom-alert " + type).show();

    setTimeout(() => {
        alertBox.fadeOut();
    }, 4000);
}




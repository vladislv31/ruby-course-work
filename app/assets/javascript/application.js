//= require jquery
//= require jquery_ujs

import "controllers"

$(document).ready(function() {
  $('#add-to-cart').submit(function(event) {
    event.preventDefault();

    var formData = $(this).serialize();

    $.ajax({
      url: '/cart_items',
      type: 'POST',
      data: formData,
      success: function(response) {
        if (response.success) {
          $('.added-to-cart-alert').fadeIn();
          setTimeout(() => {
            $('.added-to-cart-alert').fadeOut();
          }, 3000);
        }
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  });
});
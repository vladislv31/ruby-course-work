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

  $('.delete-from-cart').click(function() {
    const th = $(this);
    const id = th.attr('data-id');

    $.ajax({
      url: '/cart_items/' + id,
      type: 'DELETE',
      success: function(response) {
        if (response.success) {
          th.closest('tr').remove();
        }
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  });

  $('.decrease-quantity').click(function() {
    const th = $(this);
    const id = th.attr('data-id');
    const input = th.closest('.input-quantity').find('input');
    
    if (input.val() > 1) {
      input.val(+input.val() - 1);

      $.ajax({
        url: '/cart_items/' + id + '/update_quantity',
        method: 'PATCH',
        data: { quantity: input.val() },
        success: function(response) {
          //
        },
        error: function(xhr, status, error) {
          console.log(error);
        }
      });
    }
  });

  $('.increase-quantity').click(function() {
    const th = $(this);
    const id = th.attr('data-id');
    const input = th.closest('.input-quantity').find('input');
    
    if (input.val() < 10) {
      input.val(+input.val() + 1);

      $.ajax({
        url: '/cart_items/' + id + '/update_quantity',
        method: 'PATCH',
        data: { quantity: input.val() },
        success: function(response) {
          //
        },
        error: function(xhr, status, error) {
          console.log(error);
        }
      });
    }
  });
});
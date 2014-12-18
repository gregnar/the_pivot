function addItem(item) {
    $.post('cart_items/plus', {
      item: item
      // success: function() {
      //   $("#item-quantity").html(parseInt($("#item-quantity").html()) + 1);
      // }
    })
  }

  function removeItem(item) {
    $.post('cart_items/minus', {
      item: item
    })
  }

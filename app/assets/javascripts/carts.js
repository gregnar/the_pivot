$(function () {
  $('.add-item').on('click', addItem);
  $('.remove-item').on('click', removeItem);
});

function addItem(event) {
  console.log('+1');

  event.preventDefault;

  var $item = $(this);
  var itemId = $item.data('item_id');

  $.post('cart_items/plus', {
    item: itemId
  }).then(function () {
    var $itemCount = $item.siblings('.item-count')
    var count = parseInt($itemCount.text(), 10);
    $itemCount.text(++count);
  });
}

function removeItem(item) {
  console.log('-1');

  event.preventDefault;

  var $item = $(this);
  var itemId = $item.data('item_id');

  $.post('cart_items/minus', {
    item: itemId
  }).then(function () {
    var $itemCount = $item.siblings('.item-count')
    var count = parseInt($itemCount.text(), 10);
    $itemCount.text(--count);
  });
}

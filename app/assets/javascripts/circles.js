(function ($) {
  $.fn.GPlusCircle = function() {
    return this.each(function () {
      var $circle = $(this);
      var outer = $('<div/>', {
        id:'outer_' + $circle.attr('id')
      }).appendTo($circle);

      outer.addClass('outer-circle');
      var middle = $('<div/>', {
        id:'middle_' + $circle.attr('id')
      }).appendTo($circle);

      middle.addClass('middle-circle');
      var inner = $('<a/>', {
        id:'inner_' + $circle.attr('id'),
        href:$circle.data('link'),
        title:$circle.data('tooltip'),
        text:$circle.data('text')
      }).appendTo($circle);
      inner.addClass('inner-circle');

      $($circle).mouseover(function () {
        $('#outer_' + $circle.attr('id')).addClass('hover');
        $('#middle_' + $circle.attr('id')).addClass('hover');
      });
      $($circle).mouseout(function () {
        $('#outer_' + $circle.attr('id')).removeClass('hover');
        $('#middle_' + $circle.attr('id')).removeClass('hover');
      });
    });
  }
})($);
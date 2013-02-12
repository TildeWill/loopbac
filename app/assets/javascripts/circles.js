(function ($) {
  $.fn.GPlusCircle = function (options) {
    var settings = $.extend({
      'id':'circle',
      'text':'circle',
      'tooltip':'circle',
      'link':'http://www.google.com'
    }, options);

    return this.each(function () {

      var opt = options;

      // 'circle1','#circles'
      var circle = jQuery('<div/>', {
        id:opt.id
      }).appendTo(this);
      circle.addClass('circle');

      var outer = jQuery('<div/>', {
        id:'outer_' + opt.id
      }).appendTo(circle);
      outer.addClass('outer-circle');
      var middle = jQuery('<div/>', {
        id:'middle_' + opt.id
      }).appendTo(circle);
      middle.addClass('middle-circle');
      var inner = jQuery('<div/>', {
        id:'inner_' + opt.id,
        href:opt.link,
        title:opt.tooltip,
        rel:'external',
        text:opt.text
      }).appendTo(circle);
      inner.addClass('inner-circle');

      circle.mouseover(function () {
        $('#outer_' + opt.id).addClass('hover');
        $('#middle_' + opt.id).addClass('hover');
      });
      circle.mouseout(function () {
        $('#outer_' + opt.id).removeClass('hover');
        $('#middle_' + opt.id).removeClass('hover');
      });
    });
  }
})(jQuery);
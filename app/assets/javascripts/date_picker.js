$(function () {
  $("input.date_picker").each(function () {
    $(this).datepicker(
        {
          altFormat: "yy-mm-dd",
          dateFormat: "mm/dd/yy",
          altField: $(this).next()
        }
    );
  })
});
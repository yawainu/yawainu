$ ->

  # date-picker
  $('.form-date').find('.input-group').datetimepicker({
    format : "YYYY-MM-DD",
    icons: {
      previous: "fa fa-arrow-left",
      next: "fa fa-arrow-right"
    }
  })
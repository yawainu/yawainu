$ ->

  # 3秒後alert消滅
  $alerts = $('.alert')

  setTimeout ->
    $alerts.slideUp()
  , 3000
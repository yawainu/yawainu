$ ->

  # font-color change
  profBgColor = $('#profile').css('background-color')

  if profBgColor
    profBgColor = profBgColor.replace('rgb(','')
    profBgColor = profBgColor.replace(')','')
    profBgColor = profBgColor.split(",")

    colorVal = 0.3*profBgColor[0] + 0.6*profBgColor[1] + 0.1*profBgColor[2]

    if colorVal > 127
      $('.profile__text').css('color','#222')
    else
      $('.profile__text').css('color','#eee')
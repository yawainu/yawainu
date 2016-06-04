$ ->

  # galleryMordal
  $galleryBtn = $('.gallery__item')
  $galleryModal = $('#gallery-modal')

  $galleryBtn.on 'click', (e) ->
    $galleryModal.find('h4').html($(this).data('title'))
    $galleryModal.find('img').attr('src',$(this).data('image'))
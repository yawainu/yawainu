$ ->

  # galleryMordal
  $galleryBtn = $('.gallery__item')
  $galleryModal = $('#gallery-modal')

  $galleryBtn.on 'click', (e) ->
    $galleryModal.find('h4').html($(this).data('title'))
    $galleryModal.find('p').html($(this).data('comment'))
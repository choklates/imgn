# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('input.js-text').on 'keyup', ->
    $('button.js-button').text($(@).val())
    html2canvas $('.js-button'),
      onrendered: (canvas) ->
        $image = $('<img>', src: convertCanvasToImage(canvas))
        $('.js-image').empty().append($image)
        $('.js-dl').attr
          href: $('.js-image img').attr('src')
          download: 'button.png'

convertCanvasToImage = (canvas) ->
  image = new Image()
  image.src = canvas.toDataURL("image/png")
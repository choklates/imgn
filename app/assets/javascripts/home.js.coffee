# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('input.js-text').on 'keyup', ->
    inputText = $(@).val()
    $('button.js-button').text(inputText)
    html2canvas $('.js-button'),
      onrendered: (canvas) ->
        $image = $('<img>', src: convertCanvasToPNG(canvas))
        $('.js-image').empty().append($image)
        $('.js-dl').attr
          href: $('.js-image img').attr('src')
          download: 'button-' + inputText.replace(/\s+/g, '-').toLowerCase() + '.png'

  $('div.meme')
    .on 'keyup', 'input.js-meme-text', ->
      $this = $(@)
      inputText = $(@).val()
      $('h1.js-caption-' + $this.data('target')).text(inputText)
      html2canvas $('.js-meme-canvas'),
        onrendered: (canvas) ->
          $image = $('<img>', src: convertCanvasToJPG(canvas))
          $('.js-image').empty().append($image)
      $('.js-dl').attr
        href: $('.js-dl img').attr('src')
        download: 'button-' + inputText.replace(/\s+/g, '-').toLowerCase() + '.jpg'

convertCanvasToPNG = (canvas) ->
  image = new Image()
  image.src = canvas.toDataURL("image/png")

convertCanvasToJPG = (canvas) ->
  image = new Image()
  image.src = canvas.toDataURL("image/jpg", "1.0")

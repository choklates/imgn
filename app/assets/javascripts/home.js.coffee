# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->

  # button generator
  $input = $('input.js-text')
  $button = $('button.js-button')
  $newImg = $('<img>')
  $image = $('div.js-image')
  $downloadLink = $('a.js-dl')

  $input.on 'keyup', ->
    inputText = $(@).val()
    $button.text(inputText)
    html2canvas $button,
      onrendered: (canvas) ->
        handleCanvas(canvas, inputText)

  # meme generator
  $meme = $('div.meme')
  $memeCanvas = $('div.js-meme-canvas')
  $swapButton = $('button.js-swap')
  $swapList = $('ul.js-swap-list')

  $meme.on 'keyup', 'input.js-meme-text', ->
    $this = $(@)
    inputText = $this.val()
    $('h1.js-caption-' + $this.data('target')).text(inputText)
    html2canvas $memeCanvas,
      onrendered: (canvas) ->
        handleCanvas(canvas, inputText, 'jpg')

  $swapButton.on 'click', ->
    $swapList.toggle()

  $swapList.on 'click', 'img', ->
    $memeCanvas.find('img').attr('src', this.src)

  handleCanvas = (canvas, inputText, type) ->
    inputText = inputText or 'derp'
    type = type or 'png'
    $newImg.attr('src', convertCanvasToImage(canvas), type)
    $image.empty().append($newImg)
    $downloadLink.attr
      href: $image.find('img').attr('src')
      download: inputText.replace(/\s+/g, '-').toLowerCase() + '.' + type

convertCanvasToImage = (canvas, type) ->
  image = new Image()
  type = type or 'png'
  if type is 'jpg'
    image.src = canvas.toDataURL("image/jpg", "1.0")
  else
    image.src = canvas.toDataURL("image/png")

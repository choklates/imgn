class HomeController < ApplicationController
  def index
    @title = 'Chantel\'s Button Machine'
  end

  def meme
    @title = 'Meme Generator'
    @images = [
      'meme-not_sure_if.jpg',
      'meme-success_kid.jpg',
      'meme-forever_alone.jpg',
      'meme-one_does_not_simply.jpg',
      'meme-y_u_no.jpg',
      'meme-fwp.jpg',
      'meme-aliens.jpg'
    ]
  end
end

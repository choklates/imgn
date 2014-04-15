class HomeController < ApplicationController
  def index
    @title = 'Chantel\'s Button Machine'
  end

  def meme
    @title = 'Meme Generator'
  end
end

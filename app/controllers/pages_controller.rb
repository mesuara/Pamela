class PagesController < ApplicationController
  include HTTParty
  def home
  end
  def news
    response = HTTParty.get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8e03127955b6407ea257a287822a7767')

    render json: response
  end
end

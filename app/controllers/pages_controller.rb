class PagesController < ApplicationController
  include HTTParty
  def home
  end
  def news
    response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=#{ENV['NEWS_API_KEY']}")

    render json: response
  end
end

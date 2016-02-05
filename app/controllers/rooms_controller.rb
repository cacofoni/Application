class RoomsController < ApplicationController
  def show
    @comments = Comment.limit(1000).order(:created_at => 'desc')
    @feed = Feedjira::Feed.fetch_and_parse "http://rss.cnn.com/rss/cnn_us.rss" 
  end
end

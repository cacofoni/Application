class RoomsController < ApplicationController
  def show
     @comments = Comment.limit(1000).order(:created_at => 'desc')
     cnnFeed = Feedjira::Feed.fetch_and_parse "http://rss.cnn.com/rss/cnn_us.rss" 
     tmzFeed = Feedjira::Feed.fetch_and_parse "http://www.tmz.com/rss.xml"
     bbcFeed = Feedjira::Feed.fetch_and_parse "http://feeds.bbci.co.uk/news/rss.xml"
     slashDotFeed = Feedjira::Feed.fetch_and_parse "http://rss.slashdot.org/Slashdot/slashdotMain"
     espnNewsFeed = Feedjira::Feed.fetch_and_parse "http://sports.espn.go.com/espn/rss/news"
     forbesNewSFeed = Feedjira::Feed.fetch_and_parse "http://www.forbes.com/most-popular/feed/"
     jezebelNewSFeed = Feedjira::Feed.fetch_and_parse "http://feeds.gawker.com/jezebel/full"
     foxNewSFeed = Feedjira::Feed.fetch_and_parse "http://feeds.foxnews.com/foxnews/most-popular"
     
     @entries = cnnFeed.entries[1 .. 4] + tmzFeed.entries[1 .. 8] +  bbcFeed.entries[1 .. 4] + 
                slashDotFeed.entries[1 .. 5] + espnNewsFeed.entries[1 .. 4] + forbesNewSFeed.entries[1 .. 5] +
                jezebelNewSFeed.entries[1 .. 5] + foxNewSFeed.entries[1 .. 4]
  end
end

class TopController < ApplicationController
  def index
    @restaurants = Restaurant.limit(3)
    @reviews = Review.limit(5)
    @categories = Category.all
    @tweets = TwitterClient.new.lalameshi_tweets(search_word: "#lalameshi901")
    @user_tweets = TwitterClient.new.lalameshi_user_tweets(twitter_user: 'lalameshi')
  end

end

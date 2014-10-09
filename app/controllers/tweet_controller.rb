class TweetController < ApplicationController
  def new
  end

  def show
  end

  def create
    tmpfile = params[:tweet_image].tempfile if params[:tweet_image]
    # tmpfile = params[:tweet_image] ? params[:tweet_image].tempfile : nil

    tweet = TwitterClient.new.update(text: params[:tweet_text], file: tmpfile)
    @tweet_url = "https://twitter.com/lalameshi/status/" + tweet.id.to_s
  end
end

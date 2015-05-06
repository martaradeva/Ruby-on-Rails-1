class TweetsController < ApplicationController
  def index
    @tweets = get_tweets
  end

  private
  def get_tweets
    "tweets"
    # $twitter.home_timeline
  end
end

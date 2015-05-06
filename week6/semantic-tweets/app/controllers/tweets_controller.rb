class TweetsController < ApplicationController
  def index
    @tweets = get_tweets
    p @tweets.first.full_text
  end

  private
  def get_tweets
    $twitter.home_timeline
  end
end

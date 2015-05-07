class TweetsController < ApplicationController
  def index
    @tweets = get_tweets
  end

  private
  def get_tweets
    $twitter.home_timeline
  end

  def semantria_session
    $session
  end
end

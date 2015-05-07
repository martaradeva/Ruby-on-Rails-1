class TweetsController < ApplicationController
  def index
    @tweets = get_tweets.first(3)
    @positive_tweets = filter
  end

  private

  def get_tweets
    $twitter.home_timeline
  end

  def filter
    # wrap tweets in same array of hashes with indices.
    send_tweets
    results = receive_tweets
    # map results to original tweets by id
    p results
  end

  def send_tweets
    tweet_texts_with_id = @tweets.map.each_with_index{|tweet, index| {"id" => index.to_s, "text" => tweet.full_text}}
    # send tweets
    # p tweet_texts_with_id
    tweet_texts_with_id.each do |doc|
      # p doc["id"]
      $session.queueDocument(doc)
      if status == 202 
        then p "Document #{doc['id']} queued successfully"
      end
    end
  end

  def receive_tweets
    length = @tweets.length
    results = []
    while results.length < length do
      p "Retrieving results..."
      sleep(0.5)
      status = $session.getProcessedDocuments()
      results << status
    end
    useful_results = []
    results.first.each do |doc|
      useful_results << {id: doc["id"], score: doc["sentiment_polarity"]}
    end
    filtered_results = useful_results.select{|result| result[:score] == "positive"}
    p filtered_results
  end

end

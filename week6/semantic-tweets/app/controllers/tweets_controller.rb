class TweetsController < ApplicationController
  def index
    @tweets = get_tweets.first(5)
    @positive_tweets = filter(@tweets)
  end

  private

  def get_tweets
    $twitter.home_timeline
  end

  def filter(tweets)
    tweets_with_ids = tweets.map.each_with_index{|tweet, index| {"id" => index.to_s, "tweet" => tweet}}
    tweet_texts_with_ids = tweets_with_ids.map{ |hash| {"id" => hash["id"], "text" => hash["tweet"].full_text} }
    send_tweets(tweet_texts_with_ids)
    filtered_ids = receive_tweets(tweets)
    filtered_tweets = tweets_with_ids.select{|hash| filtered_ids.include? hash["id"] }.map{|hash| hash["tweet"]}
    # p filtered_tweets
  end

  def send_tweets(tweet_texts_with_ids)
    tweet_texts_with_ids.each do |doc|
      $session.queueDocument(doc)
      if status == 202 
        then p "Document #{doc['id']} queued successfully"
      end
    end
  end

  def receive_tweets(tweets)
    length = tweets.length
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
    p useful_results
    filtered_ids = useful_results.select{|result| result[:score] == "positive"}.map{|element| element[:id]}
  end

end

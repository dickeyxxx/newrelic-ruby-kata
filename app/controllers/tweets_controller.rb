class TweetsController < ApplicationController
  
  def index
    tweet_body = Rails.cache.fetch 'tweets', expires_in: 15.minutes do
      HTTParty.get('http://twitter.com/newrelic').body
    end

    parsed_body = Nokogiri.parse(tweet_body)
    tweet_notes = parsed_body.xpath("//p[contains(@class,'js-tweet-text')]")
    @nodes = tweet_notes.collect do |node|
      node.inner_html
    end
  end
end

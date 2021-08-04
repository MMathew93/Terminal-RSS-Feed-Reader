# frozen_string_literal: true

require_relative 'feed_text'
# RSS Feed Reader Class
class FeedReader
  include DisplayText

  attr_reader :feeds

  def initialize
    @feeds = []
    start
  end

  def start
    puts intro
    receive_rss
  end

  def receive_rss
    puts enter_rss_link
    rss_link = gets.chomp
    @feeds << rss_link
    puts additional_rss_links
    receive_rss if verify_response
  end

  def verify_response
    response = gets.chomp
    until response.match?(/[yn]/)
      puts response_error
      response = gets.chomp
    end
    response == 'y'
  end
end

FeedReader.new

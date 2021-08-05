# frozen_string_literal: true

require_relative 'feed_text'
require 'rss'
require 'open-uri'
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
    pull_rss_feeds
  end

  def receive_rss
    puts enter_rss_link
    rss_link = gets.chomp
    verifify_rss_feed(rss_link)
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

  def pull_rss_feeds
    feeds.map do |url|
      linebreak
      URI.parse(url).open do |rss|
        feed = RSS::Parser.parse(rss)
        puts "Title: #{feed.channel.title}"
        feed.items[0...5].each do |item|
          puts "Item: #{item.title}"
          puts "Link: #{item.link}"
        end
      end
    end
  end

  def verifify_rss_feed(rss_link)
    # need to implement a check to see if the provided rss feed
    # is legit or not, if not return and have user try again
    # else add it to the array
    @feeds << rss_link
  end
end

FeedReader.new

# frozen_string_literal: true

# RSS Feed Reader display text file
module DisplayText
  def intro
    <<~HEREDOC

      Hello, please enter in your RSS feed link to get the current happenings
      of your favorite websites and sources!

    HEREDOC
  end

  def enter_rss_link
    <<~HEREDOC

      Please enter your RSS Feed:

    HEREDOC
  end

  def additional_rss_links
    <<~HEREDOC

      Do you have additional RSS feeds you would like to add? y/n

    HEREDOC
  end

  def response_error
    <<~HEREDOC

      Invalid option, please try again...

    HEREDOC
  end
end

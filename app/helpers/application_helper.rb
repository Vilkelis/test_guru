# frozen_string_literal: true

module ApplicationHelper
  # Return current year for footer
  def current_year
    Time.zone.today.year
  end

  # Formats URL to github repository
  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_message(flash)
    flash.map do |key, value|
      content_tag :p, value, class: "flash #{key}"
    end.join(' ').html_safe
  end
end

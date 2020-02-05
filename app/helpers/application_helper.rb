# frozen_string_literal: true

module ApplicationHelper
  FLASH_CLASS = { notice: 'success',
                  alert: 'warning',
                  error: 'danger',
                  default: 'info' }.freeze

  # Return current year for footer
  def current_year
    Time.zone.today.year
  end

  # Formats URL to github repository
  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  # Returns class for flash message according flash key
  def flash_class(flash_key)
    FLASH_CLASS[flash_key.to_sym] || FLASH_CLASS[:default]
  end
end

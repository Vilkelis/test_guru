# frozen_string_literal: true

module ApplicationHelper
  FLASH_CLASS = { notice: 'success',
                  alert: 'warning',
                  error: 'danger',
                  default: 'info' }.freeze
  FLASH_HTML_SAFE_SUFFIX = '_html_safe'

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
    key = flash_key.to_s.delete_suffix(FLASH_HTML_SAFE_SUFFIX).to_sym
    FLASH_CLASS[key] || FLASH_CLASS[:default]
  end

  def flash_html_safe?(flash_key)
    flash_key.end_with?(FLASH_HTML_SAFE_SUFFIX)
  end
end

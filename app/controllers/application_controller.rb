# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options
    return {} if I18n.locale == I18n.default_locale

    { lang: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = if I18n.locale_available?(params[:lang])
                    params[:lang]
                  else
                    I18n.default_locale
                  end
  end
end

# frozen_string_literal: true

# Base application mailer
class ApplicationMailer < ActionMailer::Base
  default from: ENV['ADMIN_EMAIL']
  layout 'mailer'
end

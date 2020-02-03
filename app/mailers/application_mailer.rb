# frozen_string_literal: true

# Base application mailer
class ApplicationMailer < ActionMailer::Base
  default from: %("Test Guru" <mail@testguru.org>)
  layout 'mailer'
end

# frozen_string_literal: true

# Mailer for feedbacks
class FeedbacksMailer < ApplicationMailer
  helper :i18n

  def feedback(feedback)
    @feedback = feedback

    mail to: Admin.first.email,
         subject: t('.subject', app_name: TestGuru::Application::NAME)
  end
end

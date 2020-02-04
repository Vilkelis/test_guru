# frozen_string_literal: true

# Mailer for tests
class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage

    mail to: @user.email,
         subject: t('.subject', app_name: TestGuru::Application::NAME)
  end
end

# frozen_string_literal: true

# Mailer for tests
class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
    @badges = @test_passage.badges

    @badges.each do |badge|
      attachments.inline[badge.image_file_name] =
        File.read(badge.image_with_path)
    end

    mail to: @user.email,
         subject: t('.subject', app_name: TestGuru::Application::NAME)
  end
end

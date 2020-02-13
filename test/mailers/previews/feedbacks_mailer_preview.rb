# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  def feedback
    user = User.first
    feedback = Feedback.new(name: user.name,
                            email: user.email,
                            message: 'Hello!!!')

    FeedbacksMailer.feedback(feedback)
  end
end

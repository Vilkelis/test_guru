# frozen_string_literal: true

# Feedback controller
class FeedbacksController < ApplicationController
  include I18nHelper

  skip_before_action :authenticate_user!

  def new
    @feedback = if user_signed_in?
                  Feedback.new(name: current_user.name,
                               email: current_user.email)
                else
                  Feedback.new
                end
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.feedback(@feedback)

      redirect_path = user_signed_in? ? tests_path : root_path
      redirect_to redirect_path, notice: t('.notice_success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end

# frozen_string_literal: true

# Questions for test
class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_object_not_found

  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]

  # Show details for one question
  def show; end

  # Question new form
  def new
    @question = @test.questions.new
  end

  # Create new question
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  # Delete question
  def destroy
    @question.destroy!
    redirect_to test_path(@question.test)
  end

  # Question edit form
  def edit; end

  # Update question
  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_object_not_found(exception)
    raise exception unless exception.model == 'Question'

    render html: '<b>Error:</b> '.html_safe + exception.message
  end
end

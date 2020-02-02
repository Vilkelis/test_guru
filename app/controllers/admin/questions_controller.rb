# frozen_string_literal: true

# Questions for test
class Admin::QuestionsController < Admin::BaseController
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
      redirect_to [:admin, @question],
                  notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # Delete question
  def destroy
    @question.destroy!
    redirect_to admin_test_path(@question.test),
                notice: 'Question was successfully destroyed.'
  end

  # Question edit form
  def edit; end

  # Update question
  def update
    if @question.update(question_params)
      redirect_to [:admin, @question],
                  notice: 'Question was successfully updated.'
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

# frozen_string_literal: true

# Questions for test
class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_object_not_found

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  # Show question list for test
  def index
    render inline: '<h1><%= @test.title %></h1>'\
                   '<ul><% @test.questions.each do |question| %>'\
                   '<li><%= link_to question.body,'\
                   ' question_path(question) %></li>'\
                   '<% end %></ul>'\
                   '<div> <%= link_to \'New question\','\
                   ' { controller: "questions", action: "new" } %></div>'
  end

  # Show details for one question
  def show
    render inline: '<h1><%= @question.body %></h1>'\
                   '<ul><% @question.answers.each do |answer| %>'\
                   '<li><%= answer.body %></li>'\
                   '<% end %></ul>'
  end

  # Question new form
  def new
    @question = @test.questions.new
    render layout: false
  end

  # Create new question
  def create
    @test.questions.create!(question_params)
    redirect_to test_questions_path(@test)
  end

  # Delete question
  def destroy
    @question.destroy!
    redirect_to test_questions_path(@question.test)
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

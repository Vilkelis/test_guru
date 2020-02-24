# frozen_string_literal: true

# Test Passages
class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      BadgesService.new(@test_passage).give_badges
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    gist_process_service_result(result)

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  # Process gist question service result
  def gist_process_service_result(result)
    if result.success?
      Gist.create!(question: @test_passage.current_question,
                   user: current_user,
                   code: result.code,
                   url: result.url)
      flash[:notice_html_safe] = t('.success_html', url: result.url)
    else
      flash[:alert] = t('.failure')
    end
  end
end

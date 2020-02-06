# frozen_string_literal: true

# Test Passages
class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = { alert: t('.failure') }
    if result[:success]
      Gist.create!(question: @test_passage.current_question,
                   user: current_user,
                   code: result[:code],
                   url: result[:url])
      flash_options = { notice: t('.success') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

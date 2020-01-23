# frozen_string_literal: true

# Test controller
class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end
end

# frozen_string_literal: true

# Test controller
class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_object_not_found

  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.own_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @test.destroy!
    redirect_to admin_root_path, notice: 'Test was successfully destroyed.'
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_object_not_found(exception)
    raise exception unless exception.model == 'Test'

    render html: '<b>Error:</b> '.html_safe + exception.message
  end
end

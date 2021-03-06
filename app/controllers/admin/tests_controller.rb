# frozen_string_literal: true

# Test controller
class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_object_not_found

  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update update_inline destroy]

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.own_tests.new(test_params)
    if @test.save
      redirect_to [:admin, @test],
                  notice: i18n_crm('success', obj: i18n_mn(@test))
    else
      render :new
    end
  end

  def destroy
    @test.destroy!
    redirect_to admin_root_path,
                notice: i18n_crm('success', obj: i18n_mn(@test))
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test],
                  notice: i18n_crm('success', obj: i18n_mn(@test))
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_root_path
    else
      render :index
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def rescue_with_object_not_found(exception)
    raise exception unless exception.model == 'Test'

    render html: '<b>Error:</b> '.html_safe + exception.message
  end
end

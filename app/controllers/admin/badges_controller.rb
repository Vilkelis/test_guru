# frozen_string_literal: true

# Bages administration
class Admin::BadgesController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_object_not_found

  before_action :find_badges, only: %i[index]
  before_action :find_badge, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge],
                  notice: i18n_crm('success', obj: i18n_mn(@badge))
    else
      render :new
    end
  end

  def destroy
    @badge.destroy!
    redirect_to admin_badges_path,
                notice: i18n_crm('success', obj: i18n_mn(@badge))
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge],
                  notice: i18n_crm('success', obj: i18n_mn(@badge))
    else
      render :edit
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_file_name,
                                  :rule, :rule_parameter)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_badges
    @badges = Badge.all
  end

  def rescue_with_object_not_found(exception)
    raise exception unless exception.model == 'Badge'

    render html: '<b>Error:</b> '.html_safe + exception.message
  end
end

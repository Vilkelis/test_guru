# frozen_string_literal: true

# Base controller for admin controllers
class Admin::BaseController < ApplicationController
  include I18nHelper
  layout 'admin'
  before_action :admin_required!

  private

  def admin_required!
    return if current_user.admin?

    redirect_to root_path, alert: 'You are not authorized to view this page'
  end
end

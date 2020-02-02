# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_root_path : super
  end
end

# frozen_string_literal: true

# Devise session controller override
class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super do |resource|
      flash[:notice] = if resource.name.blank?
                         'Hello, Guru!'
                       else
                         "Hello, #{resource.name}!"
                       end
    end
  end

  protected

  def after_sign_in_path_for(user)
    user.admin? ? admin_root_path : super
  end
end

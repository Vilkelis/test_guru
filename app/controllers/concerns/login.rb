# frozen_string_literal: true

# Login function for several classes for using after login
module Login
  extend ActiveSupport::Concern

  private

  # Was successfully login. Writing info to the session and redirect
  def login_success(user)
    session[:user_id] = user.id
    target_url = session[:target_url]
    session[:target_url] = nil

    flash[:info] = "Welcome #{user.name}, Guru!"
    redirect_to target_url || root_path
  end

  def login_invalid
    flash.now[:alert] = 'Invalid email or password.'
    render :new
  end
end

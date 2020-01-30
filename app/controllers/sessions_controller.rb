# frozen_string_literal: true

# User sessions
class SessionsController < ApplicationController
  include Login

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      login_success(user)
    else
      login_invalid
    end
  end

  def destroy
    @current_user = nil
    reset_session
    redirect_to root_path
  end

  private

  def login_success(user)
    session[:user_id] = user.id
    flash[:info] = "Welcome #{user.name}, Guru!"
    redirect_to session[:target_url] || root_path
  end

  def login_invalid
    flash.now[:alert] = 'Invalid email or password.'
    render :new
  end
end
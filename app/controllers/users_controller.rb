# frozen_string_literal: true

# User controller
class UsersController < ApplicationController
  include Login

  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_success(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end

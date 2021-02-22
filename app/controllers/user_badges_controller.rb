# frozen_string_literal: true

# Test controller
class UserBadgesController < ApplicationController
  def index
    @user_badges = current_user.user_badges
    @badges = Badge.all
  end
end

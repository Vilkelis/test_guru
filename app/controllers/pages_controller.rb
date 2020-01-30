# frozen_string_literal: true

# Controller for common pages (not authenticated access allowed)
class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end
end

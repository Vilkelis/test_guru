# frozen_string_literal: true

# Gists for questions
class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end
end

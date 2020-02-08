# frozen_string_literal: true

# Classes for clients responses
module ClientResults
  # Base class for all responses
  class BaseResult
    def success?
      false
    end
  end

  # Result for Gist creation
  class GistCreateResult < BaseResult
    attr_accessor :code, :url, :data

    def initialize(params = {})
      @code = params[:code]
      @url = params[:url]
      @data = params[:data]
    end

    def success?
      @code.present? && @url.present?
    end
  end
end

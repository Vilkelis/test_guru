# frozen_string_literal: true

require 'client_results'

# GitHub API interface
class GitHubClient
  def initialize
    @client = setup_client
  end

  # Create gist. Params are follow:
  #  :description (String)
  #  :public (Boolean) - Sets gist visibility
  #  :files (Array<Hash>) - Files that make up this gist.
  #   Keys should be the filename,
  #   the value a Hash with a :content key with text content of the Gist.
  def create_gist(params)
    res = ClientResults::GistCreateResult.new
    begin
      response = @client.create_gist(params)

      # convert response to the standard format of result
      if response.present?
        res.code = response[:id]
        res.url = response[:html_url]
        res.data = response
      end
    rescue StandardError => e
      res.data = e
    end

    res
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end
end

# frozen_string_literal: true

# Gist on question
class GistQuestionService < BaseService
  def initialize(question, client = nil)
    @question = question
    @test = question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: gist_param_description,
      public: true,
      files: {
        gist_param_filename => {
          content: gist_param_content
        }
      }
    }
  end

  def gist_param_description
    t('.gist_param_description',
      test: @test.title,
      application: TestGuru::Application::NAME)
  end

  def gist_param_filename
    "#{TestGuru::Application::NAME.gsub(' ', '-')}-question.txt"
  end

  def gist_param_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

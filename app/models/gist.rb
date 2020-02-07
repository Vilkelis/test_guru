# frozen_string_literal: true

# Gists for questions
class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :url, :code, presence: true
end

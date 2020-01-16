# frozen_string_literal: true

# Test question
class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
end

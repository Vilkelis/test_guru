# frozen_string_literal: true

# Answer for test querstion
class Answer < ApplicationRecord
  belongs_to :question
end

# frozen_string_literal: true

# Tests for user
class TestsUser < ApplicationRecord
  belongs_to :user
  belongs_to :test
end

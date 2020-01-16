# frozen_string_literal: true

# Category for test
class Category < ApplicationRecord
  has_many :tests
end

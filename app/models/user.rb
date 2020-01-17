# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id',
                       inverse_of: :author, dependent: :destroy
  # Returns user tests for specific test level
  def used_tests(level)
    tests.where(level: level)
  end
end

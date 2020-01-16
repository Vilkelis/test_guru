# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id',
                       inverse_of: :author, dependent: :destroy
  # Returns user tests for specific test level
  def tests(level)
    Test.joins('INNER JOIN tests_users ON tests_users.test_id = tests.id')
        .where(tests: { level: level }, tests_users: { user_id: id })
  end
end

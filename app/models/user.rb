# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  # Returns user tests for specific test level
  def tests(level)
    Test.joins('INNER JOIN user_tests ON user_tests.test_id = tests.id')
        .where(tests: { level: level }, user_tests: { user_id: id })
  end
end

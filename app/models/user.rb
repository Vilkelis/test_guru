# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  # Returns user tests for specific test level
  def tests(level)
    UserTest.where(user_id: id, level: level)
            .joins('INNER JOIN tests ON test.id = user_tests.id')
            .where(tests: { level: level })
  end
end

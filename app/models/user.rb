# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id',
                       inverse_of: :author, dependent: :destroy

  validates :name, :email, presence: true

  # Returns user tests for specific test level
  # the level can take values :simple, :medium, :hard
  def used_tests(level)
    unless %i[simple medium hard].include?(level)
      raise 'Invalid value for level'
    end

    tests.send(level)
  end
end

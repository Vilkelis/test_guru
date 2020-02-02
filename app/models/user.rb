# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  # Returns user tests for specific test level
  # the level can take values :simple, :medium, :hard
  def used_tests(level)
    unless %i[simple medium hard].include?(level)
      raise 'Invalid value for level'
    end

    tests.send(level)
  end
end

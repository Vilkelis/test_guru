# frozen_string_literal: true

# Application user
class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

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

  def admin?
    is_a?(Admin)
  end
end

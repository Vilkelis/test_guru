# frozen_string_literal: true

# Test
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy
  belongs_to :author, class_name: 'User'

  scope :simple_complexity, -> { where(level: (0..1)) }
  scope :medium_complexity, -> { where(level: (2..4)) }
  scope :hard_complexity, -> { where(level: (3..Float::INFINITY)) }

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false,
                                  scope: :level,
                                  message: 'Test title and level not unique' }

  # Returns all tests who have specific category title
  def self.tests_for_category(category_title)
    joins(:category).where(categories: { title: category_title })
                    .order(title: :desc).pluck(:title)
  end
end

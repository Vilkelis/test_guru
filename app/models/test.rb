# frozen_string_literal: true

# Test
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy
  belongs_to :author, class_name: 'User'

  scope :simple, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (3..Float::INFINITY)) }

  scope :tests_for_category, lambda { |category_title|
                               joins(:category)
                                 .merge(Category.for_title(category_title))
                                 .pluck(:title)
                             }

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false,
                                  scope: :level,
                                  message: 'Test title and level not unique' }
end

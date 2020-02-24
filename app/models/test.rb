# frozen_string_literal: true

# Test
class Test < ApplicationRecord
  TEST_LEVEL_SYMBOLS = %i[simple medium hard].freeze

  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'Admin'

  scope :simple, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }

  scope :tests_for_category, lambda { |category_title|
                               joins(:category)
                                 .merge(Category.for_title(category_title))
                                 .pluck(:title)
                             }

  scope :for_category, lambda { |category_title|
                         joins(:category)
                           .merge(Category.for_title(category_title))
                       }

  scope :for_title, ->(title) { where(title: title) }

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :title, uniqueness: { case_sensitive: false,
                                  scope: :level,
                                  message: 'Test title and level not unique' }

  def self.valid_level_symbol?(level_sym)
    TEST_LEVEL_SYMBOLS.include?(level_sym.to_sym)
  end
end

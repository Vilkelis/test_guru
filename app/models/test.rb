# frozen_string_literal: true

# Test
class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User'

  # Returns all tests who have specific category title
  def self.tests_for_category(category_title)
    joins('INNER JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category_title })
      .order(title: :desc).pluck(:title)
  end
end

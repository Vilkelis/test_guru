# frozen_string_literal: true

# Test
class Test < ApplicationRecord
  # Returns all tests who have specific category title
  def self.tests_for_category(category_title)
    joins('INNER JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category_title })
      .order(title: :desc).pluck(:title)
  end
end

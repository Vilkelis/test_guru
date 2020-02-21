# frozen_string_literal: true

# Category for test
class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :restrict_with_error
  has_many :badges, dependent: :restrict_with_error

  scope :for_title, lambda { |title|
                      where(title: title)
                        .unscope(:order)
                        .order(title: :desc)
                    }

  validates :title, presence: true
end

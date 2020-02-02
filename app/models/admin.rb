# frozen_string_literal: true

# Admin users
class Admin < User
  validates :name, presence: true
  validates :surname, presence: true

  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id',
                       inverse_of: :author, dependent: :destroy
end

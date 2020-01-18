# frozen_string_literal: true

# Add unique index to Test
class AddUniqueIndexToTest < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[title level], unique: true
  end
end

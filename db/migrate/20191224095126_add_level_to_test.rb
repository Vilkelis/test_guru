# frozen_string_literal: true

# Add level for test with default value
class AddLevelToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :level, :integer, null: false, default: 1
  end
end

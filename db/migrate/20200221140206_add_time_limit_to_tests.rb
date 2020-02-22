# frozen_string_literal: true

# Add columns for test time limitation
class AddTimeLimitToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_limited, :boolean, null: false, default: false
    add_column :tests, :time_limit_min, :integer, null: false, default: 0
  end
end

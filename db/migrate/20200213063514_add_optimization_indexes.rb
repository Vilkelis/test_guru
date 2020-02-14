# frozen_string_literal: true

# Create indexes for optimization
class AddOptimizationIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :questions, %i[test_id id]
    add_index :test_passages, %i[user_id test_id id], order: { id: :desc }
  end
end

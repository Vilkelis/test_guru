# frozen_string_literal: true

# Add not null check for querstion body
class AddQestionsBodyNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :questions, :body, false
  end
end

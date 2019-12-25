# frozen_string_literal: true

# Add not null check for test title
class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :title, false
  end
end

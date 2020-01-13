# frozen_string_literal: true

# Add not null check for category title
class AddCategoriesTitleNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :categories, :title, false
  end
end

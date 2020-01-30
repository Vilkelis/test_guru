# frozen_string_literal: true

# Add unique index to users.email and and not null constraint for this collumn
class AddUniqueIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
  end
end

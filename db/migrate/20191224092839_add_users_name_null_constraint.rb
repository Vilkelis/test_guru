# frozen_string_literal: true

# Add not null check for user name
class AddUsersNameNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, false
  end
end

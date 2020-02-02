# frozen_string_literal: true

# Allow null for name (for simple users)
class ChangeNullForNameOfUser < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name, true
  end
end

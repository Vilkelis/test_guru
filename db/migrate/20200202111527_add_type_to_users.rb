# frozen_string_literal: true

# Add type attribute to Users (for Admin support)
class AddTypeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
  end
end

# frozen_string_literal: true

# Add email field to user
class AddEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string
  end
end

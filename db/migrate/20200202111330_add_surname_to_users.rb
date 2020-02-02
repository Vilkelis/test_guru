# frozen_string_literal: true

# Add surname collumn to users
class AddSurnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :surname, :string
  end
end

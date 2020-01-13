# frozen_string_literal: true

# Create User-Test relation table
class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :test, null: false, foreign_key: true
      t.timestamps
    end
    add_index :user_tests, %i[user_id test_id], unique: true
  end
end

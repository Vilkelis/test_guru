# frozen_string_literal: true

# Create user badges table
class CreateUserBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_badges do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :badge, null: false, foreign_key: true
      t.belongs_to :test_passage, null: false, foreign_key: true
      t.timestamps
    end
  end
end

# frozen_string_literal: true

# Create badges table
class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_file_name, null: false
      t.integer :rule
      t.belongs_to :category, null: true, foreign_key: true
      t.belongs_to :test, null: true, foreign_key: true
      t.timestamps
    end
  end
end

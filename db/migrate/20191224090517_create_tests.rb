# frozen_string_literal: true

# Create tests table
class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

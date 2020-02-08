# frozen_string_literal: true

# Create gists table
class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :code, null: false
      t.text :url, null: false
      t.timestamps
    end
  end
end

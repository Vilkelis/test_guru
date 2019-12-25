# frozen_string_literal: true

# Create questions table
class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.belongs_to :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end

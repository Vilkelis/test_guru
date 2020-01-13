# frozen_string_literal: true

# Create question answers table
class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end

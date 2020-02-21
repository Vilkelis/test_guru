# frozen_string_literal: true

# Add column for indicate success completed test passages
class AddSuccessCompletedToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :success_completed, :boolean, null: false, default: false

    TestPassage.all.each do |test_passage|
      test_passage.validate
      test_passage.save!
    end
  end
end

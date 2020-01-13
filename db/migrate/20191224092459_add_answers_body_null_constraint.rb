# frozen_string_literal: true

# Add not null check for answer body
class AddAnswersBodyNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :body, false
  end
end

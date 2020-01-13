# frozen_string_literal: true

# Add not null check for answer corrent attribute
class AddAnswersCorrectNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :correct, false
  end
end

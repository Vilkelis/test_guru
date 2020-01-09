# frozen_string_literal: true

# Add default value for answer correct attribute
class AddAnswersCorrectDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :answers, :correct, from: true, to: false
  end
end

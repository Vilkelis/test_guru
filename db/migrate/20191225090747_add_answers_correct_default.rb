# frozen_string_literal: true

# Add default value for answer correct attribute
class AddAnswersCorrectDefault < ActiveRecord::Migration[6.0]
  def up
    change_column_default :answers, :correct, false
  end

  def down
    change_column_default :answers, :correct, nil
  end
end

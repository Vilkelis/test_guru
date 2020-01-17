# frozen_string_literal: true

# Add author_id field for relation to user
class AddAuthorToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end

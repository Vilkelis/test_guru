# frozen_string_literal: true

# Add author_id field for relation to user
class AddAuthorToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author
    add_foreign_key :tests, :users, column: :author_id
  end
end

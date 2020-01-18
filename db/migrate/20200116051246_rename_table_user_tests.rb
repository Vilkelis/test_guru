# frozen_string_literal: true

# Change name of User-Test relation table according Rails convensions
class RenameTableUserTests < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_tests, :tests_users
  end
end

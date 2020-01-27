# frozen_string_literal: true

# Drop unused table test_users
class DropTableTestUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :tests_users, if_exists: true
  end
end

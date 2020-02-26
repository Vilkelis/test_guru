# frozen_string_literal: true

# Remove some settings column for badges. Add universal one column
class ChangeFieldsForBadges < ActiveRecord::Migration[6.0]
  def up
    remove_column :badges, :category_id
    remove_column :badges, :test_id
    add_column :badges, :rule_parameter, :text
  end

  def down
    remove_column :badges, :rule_parameter
    change_table :badges do |t|
      t.belongs_to :category, null: true, foreign_key: true
      t.belongs_to :test, null: true, foreign_key: true
    end
  end
end

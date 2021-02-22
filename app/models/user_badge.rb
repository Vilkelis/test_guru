# frozen_string_literal: true

# User badges
class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :test_passage

  def self.last_badged_passage_id(user_id)
    where(user_id: user_id).maximum(:test_passage_id).to_i
  end
end

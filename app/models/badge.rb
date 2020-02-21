# frozen_string_literal: true

# Badges
class Badge < ApplicationRecord
  include BadgeRulesAvailability
  include BadgeImagesAvailability

  has_many :users, through: :user_badges

  validates :title, presence: true

  def self.give_for_passage(test_passage)
    find_each do |badge|
      badge.give_for(test_passage)
    end
  end

  def give_for(test_passage)
    return unless rule?(test_passage)

    gift = user_badges.new(user: test_passage.user, test_passage: test_passage)
    gift.save!
  end
end

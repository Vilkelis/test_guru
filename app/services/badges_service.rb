# frozen_string_literal: true

# Badges service - giv badges for tests
class BadgesService < BaseService
  BADGE_RULES = { 1 => BadgeRules::RuleAllOfCategoryPassage,
                  2 => BadgeRules::RuleFirstAttemptPassage,
                  3 => BadgeRules::RuleAllOfLevelPassage }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def badges
    # Give badges only for success tests
    return [] unless @test_passage.success?

    Badge.find_each.filter do |badge|
      self.class.rules[badge.rule]&.new(badge, @test_passage)&.rule_right?
    end
  end

  def self.rules
    BADGE_RULES
  end
end

# frozen_string_literal: true

# Badges service - giv badges for tests
class BadgesService < BaseService
  BADGE_RULES = { 1 => BadgeRules::RuleAllOfCategoryPassage,
                  2 => BadgeRules::RuleFirstAttemptPassage,
                  3 => BadgeRules::RuleAllOfLevelPassage }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def give_badges
    Badge.find_each do |badge|
      rule_class = self.class.rules[badge.rule]
      if rule_class&.new(badge, @test_passage)&.rule_right?
        gift = UserBadge.new(user: @test_passage.user,
                             badge: badge,
                             test_passage: @test_passage)
        gift.save!
      end
    end
  end

  def self.valid_rule_code?(rule_code)
    rules[rule_code]
  end

  def self.valid_rule_parameter?(rule_code, rule_parameter)
    rule_class = rules[rule_code]

    # for an invalid rule all parameters are valid
    return true unless rule_class

    rule_class.valid_parameter?(rule_parameter)
  end

  def self.rules
    BADGE_RULES
  end

  # Check badge rule for test_passage
  def self.rule_right?(test_passage)
    rule_class = BADGE_RULES[test_passage.test.rule]
    rule_class&.new(test_passage)&.rule_right?
  end
end

# frozen_string_literal: true

# Badge rule: passed all tests of specified category
class BadgeRules::RuleAllOfCategoryPassage < BadgeRules::BaseBadgeRule
  # Checks parameter for correctness
  def self.valid_parameter?(parameter)
    Test.for_category(parameter).first
  end

  # Is the rule right for the test_passage?
  def rule_right?
    test_ids = test_ids_passed_after
    Test.for_category(badge.rule_parameter).exists? &&
      Test.for_category(badge.rule_parameter)
          .where.not(id: test_ids).none?
  end
end

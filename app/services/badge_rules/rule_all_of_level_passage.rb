# frozen_string_literal: true

# Badge rule: passed all test for specified level
class BadgeRules::RuleAllOfLevelPassage < BadgeRules::BaseBadgeRule
  # Checks parameter for correctness
  def self.valid_parameter?(parameter)
    Test.valid_level_symbol?(parameter)
  end

  # Localized rule title with parameter
  def self.title_with_parameter(parameter)
    parameter = I18n.translate(parameter,
                               scope: 'activerecord.values.test.level')
    translate_rule('rule_with_parameter', rule_parameter: parameter)
  end

  # Is the rule right for the test_passage?
  def rule_right?
    test_ids = tests_passed_after
    Test.send(badge.rule_parameter).count.nonzero? &&
      Test.send(badge.rule_parameter).where.not(id: test_ids).count.zero?
  end
end

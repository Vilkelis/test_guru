# frozen_string_literal: true

# Badge rule: passed specified test on first attempt
class BadgeRules::RuleFirstAttemptPassage < BadgeRules::BaseBadgeRule
  # Checks parameter for correctness
  def self.valid_parameter?(parameter)
    Test.for_title(parameter).first
  end

  # Is the rule right for the test_passage?
  def rule_right?
    test_valid_for_rule? &&
      TestPassage.where(user_id: test_passage.user_id,
                        test_id: test_passage.test_id)
                 .where.not(id: test_passage.id).count.zero?
  end

  private

  def test_valid_for_rule?
    test = Test.for_title(badge.rule_parameter).first
    return unless test

    test_passage.test_id == test.id
  end
end

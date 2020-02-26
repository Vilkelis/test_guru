# frozen_string_literal: true

# Base class for Badge rules
class BadgeRules::BaseBadgeRule
  BASE_I18N_SCOPE = 'activerecord.values.badge.'

  attr_reader :test_passage, :badge

  def initialize(badge, test_passage)
    @test_passage = test_passage
    @badge = badge
  end

  # Is the rule right for test_passage?
  def rule_right?
    false
  end

  # Checks parameter for correctness
  def self.valid_parameter?(parameter)
    parameter
  end

  # Localized rule title
  def self.title
    translate_rule('rule')
  end

  # Localized rule title with parameter
  def self.title_with_parameter(parameter)
    translate_rule('rule_with_parameter', rule_parameter: parameter)
  end

  # Description for parameter setup
  def self.param_description
    translate_rule('rule_parameter_description')
  end

  def self.translate_rule(path, options = {})
    options.store(:scope, BASE_I18N_SCOPE + path)
    I18n.translate name.demodulize.tableize, options
  end

  protected

  # Returns test_ids of tests which was successfully
  # passed after specified test_passage
  def test_ids_passed_after
    user_id = @test_passage.user_id
    passage_id = UserBadge.last_badged_passage_id(user_id)
    TestPassage.success_completed_after_passage(user_id, passage_id)
               .pluck(:test_id)
  end
end

# frozen_string_literal: true

# Availability to use badge rules
module BadgeRulesAvailability
  extend ActiveSupport::Concern

  included do
    BADGE_RULES = { 1 => :all_of_category_passage,
                    2 => :first_attempt_passage,
                    3 => :all_of_hard_level_passage,
                    4 => :all_of_medium_level_passage,
                    5 => :all_of_simple_level_passage }.freeze
    BADGE_RULES_FOR_CATEGORY = [1].freeze
    BADGE_RULES_FOR_TEST = [2].freeze

    belongs_to :category, optional: true
    belongs_to :test, optional: true
    has_many :user_badges, dependent: :restrict_with_error

    validates :category, presence: true, if: :rule_needs_category?
    validates :test, presence: true, if: :rule_needs_test?

    validates :rule, presence: true
    validate :validate_rule_value

    before_save :before_save_badge_rule
  end

  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods
    def rule_needs_category?(rule)
      BADGE_RULES_FOR_CATEGORY.include?(rule)
    end

    def rule_needs_test?(rule)
      BADGE_RULES_FOR_TEST.include?(rule)
    end
  end

  # Check badge rule for test_passage
  def rule?(test_passage)
    rule_proc = BADGE_RULES[rule]
    rule_proc && send(rule_proc.to_s + '?', test_passage)
  end

  private

  def validate_rule_value
    return if BADGE_RULES[rule]

    errors[:rule] << I18n.t('invalid_rule_value',
                            scope: 'activerecord.errors.messages.badge')
  end

  def rule_needs_category?
    self.class.rule_needs_category?(rule)
  end

  def rule_needs_test?
    self.class.rule_needs_test?(rule)
  end

  def before_save_badge_rule
    self.category_id = nil unless rule_needs_category?
    self.test_id = nil unless rule_needs_test?
  end

  # Methods for check badge rules
  #
  def all_of_category_passage?(test_passage)
    test_ids = tests_passed_after(test_passage)
    Test.where(category_id: category_id).count.nonzero? &&
      Test.where(category_id: category_id)
          .where.not(id: test_ids).count.zero?
  end

  def first_attempt_passage?(test_passage)
    user_id = test_passage.user_id

    test_passage.test_id == test_id &&
      TestPassage.where(user_id: user_id,
                        test_id: test_passage.test_id)
                 .where.not(id: test_passage.id).count.zero?
  end

  def all_of_hard_level_passage?(test_passage)
    test_ids = tests_passed_after(test_passage)
    Test.hard.count.nonzero? &&
      Test.hard.where.not(id: test_ids).count.zero?
  end

  def all_of_medium_level_passage?(test_passage)
    test_ids = tests_passed_after(test_passage)
    Test.medium.count.nonzero? &&
      Test.medium.where.not(id: test_ids).count.zero?
  end

  def all_of_simple_level_passage?(test_passage)
    test_ids = tests_passed_after(test_passage)
    Test.simple.count.nonzero? &&
      Test.simple.where.not(id: test_ids).count.zero?
  end

  # Returns test_ids of tests which was successfully
  # passed after specified test_passage
  def tests_passed_after(test_passage)
    user_id = test_passage.user_id
    last_passage_id = user_badges.last_passage_id(user_id)
    TestPassage.success_completed_after_passage(user_id, last_passage_id)
  end
end

# frozen_string_literal: true

# Badges
class Badge < ApplicationRecord
  include BadgeImagesAvailability

  has_many :user_badges, dependent: :restrict_with_error
  has_many :users, through: :user_badges

  validates :title, presence: true

  validates :rule, inclusion: { in: BadgesService.rules.keys,
                                message: I18n.t('invalid_rule_value',
                                                scope: [:activerecord,
                                                        :errors,
                                                        :messages,
                                                        :badge]) }

  validate :validate_rule_parameter

  private

  def validate_rule_parameter
    rule_class = BadgesService.rules[rule]

    # for an invalid rule all parameters are valid
    return unless rule_class

    return if rule_class.valid_parameter?(rule_parameter)

    errors[:rule_parameter] << I18n.t('invalid_rule_parameter',
                                      scope: 'activerecord.errors.'\
                                             'messages.badge')
  end
end

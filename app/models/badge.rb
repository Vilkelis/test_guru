# frozen_string_literal: true

# Badges
class Badge < ApplicationRecord
  include BadgeImagesAvailability

  has_many :user_badges, dependent: :restrict_with_error
  has_many :users, through: :user_badges

  validates :title, presence: true
  validate :validate_rule_value
  validate :validate_rule_parameter

  private

  def validate_rule_value
    return if BadgesService.valid_rule_code?(rule)

    errors[:rule] << I18n.t('invalid_rule_value',
                            scope: 'activerecord.errors.messages.badge')
  end

  def validate_rule_parameter
    return if BadgesService.valid_rule_parameter?(rule, rule_parameter)

    errors[:rule_parameter] << I18n.t('invalid_rule_parameter',
                                      scope: 'activerecord.errors.'\
                                             'messages.badge')
  end
end

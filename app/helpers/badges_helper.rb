# frozen_string_literal: true

# Badges controller helper
module BadgesHelper
  # title for Edit or New form of answerbadge
  def badge_header(badge)
    i18n_form_header(badge)
  end

  # Returns rule name for badge
  def badge_rule(badge)
    rule_name(badge.rule)
  end

  # Returns rule name for badge
  def badge_rule_full(badge)
    rule_name(badge.rule, badge.rule_parameter)
  end

  # Returns rule name by rule index
  def rule_name(rule_number, rule_parameter = nil)
    rule = BadgesService.rules[rule_number]
    return unless rule

    if rule_parameter
      rule.title_with_parameter(rule_parameter)
    else
      rule.title
    end
  end

  def badge_rules_for_select
    BadgesService.rules.collect do |key, value|
      [value.title, key, data: { help: value.param_description }]
    end
  end

  def badge_image_file_names
    Badge.available_image_file_names
  end

  def badge_empty_image
    Badge::EMPTY_IMAGE
  end

  def badge_image_tag(badge, options)
    image_tag badge.image_src,
              options.merge!(data: { base_url: badge.image_url })
  end
end

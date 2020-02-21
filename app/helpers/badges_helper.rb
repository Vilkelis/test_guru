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

  # Returns rule name for badge with caregory or test
  def badge_rule_full(badge)
    text = case badge_rule_view_type(badge.rule)
           when :category
             badge.category.title
           when :test
             badge.test.title
           end
    rule_name(badge.rule, text)
  end

  # Returns rule name by rule index
  def rule_name(rule_number, object_title = nil)
    rule = Badge::BADGE_RULES[rule_number] || :no_rule
    if object_title
      t(rule.to_s,
        scope: 'activerecord.values.badge.rule_with_object',
        object_title: object_title)
    else
      t(rule, scope: 'activerecord.values.badge.rule')
    end
  end

  def badge_rules_for_select
    Badge::BADGE_RULES.collect do |key, _value|
      [rule_name(key), key, data: { view_type: badge_rule_view_type(key) }]
    end
  end

  def badge_rule_view_type(rule_number)
    if Badge.rule_needs_category?(rule_number)
      :category
    elsif Badge.rule_needs_test?(rule_number)
      :test
    else
      :none
    end
  end

  def badge_image_file_names
    Badge.available_image_file_names
  end

  def badge_image_tag(image_file_name, options)
    image_tag Badge.image_src(image_file_name),
              options.merge!(data: { base_url: Badge::BADGE_IMAGE_URL })
  end
end

# frozen_string_literal: true

# Test helpers methods
module TestsHelper
  # Returns test level human-readable representation
  def test_level(test)
    level_name = if (0..1).include?(test.level)
                   :simple
                 elsif (2..4).include?(test.level)
                   :medium
                 elsif test.level >= 5
                   :hard
                 else
                   :none
                 end
    "#{test.level}: #{t(level_name, scope: 'activerecord.values.test.level')}"
  end

  def test_header(test)
    i18n_form_header(test)
  end
end

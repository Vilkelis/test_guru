# frozen_string_literal: true

# Test helpers methods
module TestsHelper
  # Returns test level human-readable representation
  def test_level(test)
    if (0..1).include?(test.level)
      :simple
    elsif (2..4).include?(test.level)
      :medium
    elsif test.level >= 5
      :hard
    else
      :none
    end
  end
end

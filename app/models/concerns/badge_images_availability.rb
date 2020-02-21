# frozen_string_literal: true

# Availability to use badge images
module BadgeImagesAvailability
  extend ActiveSupport::Concern

  included do
    BADGE_IMAGE_URL = '/badges/'
    BADGE_IMAGE_PATH = 'public/badges'
    EMPTY_IMAGE = 'none.png'
  end

  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods
    def available_image_file_names
      Dir.glob('*', base: Dir.getwd + '/' + BADGE_IMAGE_PATH)
    end

    def image_src(image_file_name)
      if image_file_name
        BADGE_IMAGE_URL + image_file_name
      else
        BADGE_IMAGE_URL + EMPTY_IMAGE
      end
    end
  end
end

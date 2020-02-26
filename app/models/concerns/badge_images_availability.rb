# frozen_string_literal: true

# Availability  to use badge images
module BadgeImagesAvailability
  extend ActiveSupport::Concern

  included do
    BADGE_IMAGE_URL = '/badges/'
    BADGE_IMAGE_PATH = 'public/badges'
    EMPTY_IMAGE = 'none.png'

    validate :valudate_image_file_name
  end

  def image_with_path
    if image_file_name
      self.class.image_path + '/' + image_file_name
    else
      self.class.image_path + '/' + EMPTY_IMAGE
    end
  end

  def image_src
    if image_file_name
      BADGE_IMAGE_URL + image_file_name
    else
      BADGE_IMAGE_URL + EMPTY_IMAGE
    end
  end

  def image_url
    BADGE_IMAGE_URL
  end

  def valudate_image_file_name
    return if self.class.available_image_file_names.include?(image_file_name)

    errors[:image_file_name] << I18n.t('invalid_image_file_name',
                                       scope: 'activerecord.errors.'\
                                              'messages.badge')
  end

  # methods defined here are going to extend the class, not the instance of it
  module ClassMethods
    def available_image_file_names
      Dir.glob('*', base: image_path).reject do |file|
        file == EMPTY_IMAGE
      end
    end

    def image_path
      Dir.getwd + '/' + BADGE_IMAGE_PATH
    end
  end
end

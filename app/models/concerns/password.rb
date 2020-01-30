# frozen_string_literal: true

# Password function for users model
module Password
  extend ActiveSupport::Concern

  included do
    has_secure_password
    validates :password, length: { minimum: 4 }
  end
end

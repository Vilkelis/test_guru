# frozen_string_literal: true

# Feedback message (we don't need a database table for this model)
class Feedback < ApplicationRecordNotable
  include EmailValidatable

  attr_accessor :name, :email, :message
  validates :email, :message, presence: true
  validates :email, email: true
  validates :message, length: 5..500
end

# frozen_string_literal: true

# Base class for model with out table
class ApplicationRecordNotable
  include ActiveModel::Model
  extend ActiveModel::Translation

  attr_accessor :id

  def self.i18n_scope
    :activerecord
  end
end

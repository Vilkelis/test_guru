# frozen_string_literal: true

# I18n helper methods
module I18nHelper
  # Returns attribute human name for specific resource
  # resource can be of ActiveRecord or ActiveRecord_Relation class
  def i18n_ma(resource, attribute, options = {})
    model_class(resource).human_attribute_name attribute, options
  end

  # Returns model name for specific count
  # resource can be of ActiveRecord or ActiveRecord_Relation class
  def i18n_mn(resource, options = {})
    model_class(resource).model_name.human options
  end

  # Returns translation for application CRUD purposes
  def i18n_cr(path, options = {})
    options.store(:scope, 'helpers.crud')
    t path, options
  end

  # Returns translation for application CRUD message
  def i18n_crm(path, options = {})
    options.store(:scope, "helpers.crud.message.#{action_name}")
    t path, options
  end

  # Returns header for Edit or Create form of resource (ActiveRecord)
  def i18n_form_header(resource)
    if resource.new_record?
      i18n_cr('action_full.new', obj: i18n_mn(resource))
    else
      i18n_cr('action_full.edit', obj: i18n_mn(resource))
    end
  end

  # Returns text representation for boolean value
  def i18n_b(boolean_value)
    t "helpers.#{boolean_value}"
  end

  private

  # Returns model class from ActiveRecord of AcitveRecord_Relation object
  def model_class(resource)
    if resource.is_a?(ActiveRecord::Base)
      resource.class
    else
      resource.model
    end
  end
end

# frozen_string_literal: true

# Base class for services. Allow translation
class BaseService
  I18N_PATH_PREFIX = 'services'

  def translate(*args)
    key = args.first
    if key.is_a?(String) && (key[0] == '.')
      key = "#{I18N_PATH_PREFIX}.#{service_path.tr('/', '.')}#{key}"
      args[0] = key
    end

    I18n.translate(*args)
  end

  alias t translate

  def service_path
    return if self.class.anonymous?

    @service_path ||= self.class.name.to_s.sub(/Service$/, '').underscore
  end
end

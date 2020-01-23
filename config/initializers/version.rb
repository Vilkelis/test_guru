# frozen_string_literal: true

module TestGuru
  class Application < Rails::Application
    # Application version
    # see semver.org
    VERSION = '0.1.0'
    AUTHOR = 'Stepan Golovanov'
    NAME = 'Test Guru'
    GITHUB_AUTHOR = 'Vilkelis'
    GITHUB_REPO = 'test_guru'
    DESCRIPTION = 'Система учебных тестов: '\
                  'Позволяет пользователям проходить тесты. '\
                  'Так же пользователи могут создавать свои собственные тесты.'
    PROJECT_DESCRIPTION = 'Учебный проект в школе Thinknetica'
    PROJECT_LINK = 'https://thinknetica.com'
  end
end

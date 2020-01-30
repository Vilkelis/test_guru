# frozen_string_literal: true

require 'test_helper'

# Tests for session controller
class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get sessions_create_url
    assert_response :success
  end
end

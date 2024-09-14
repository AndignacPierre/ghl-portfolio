require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get bio' do
    get pages_bio_url
    assert_response :success
  end

  test 'should get contact' do
    get pages_contact_url
    assert_response :success
  end
end

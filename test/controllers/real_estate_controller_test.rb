require 'test_helper'

class RealEstateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get real_estate_index_url
    assert_response :success
  end

end

require 'test_helper'


class IndexControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get index_home_url
    assert_response :success
  end

end

require 'test_helper'

class ComplaintsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get complaints_new_url
    assert_response :success
  end

  test "should get create" do
    get complaints_create_url
    assert_response :success
  end

end

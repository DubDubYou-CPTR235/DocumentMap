require 'test_helper'

class LoginRequiredControllerTest < ActionController::TestCase
  test "should get add_document" do
    get :add_document
    assert_response :success
  end

end

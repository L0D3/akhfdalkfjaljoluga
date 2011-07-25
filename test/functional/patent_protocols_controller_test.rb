require 'test_helper'

class PatentProtocolsControllerTest < ActionController::TestCase
  setup do
    @patent_protocol = patent_protocols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patent_protocols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patent_protocol" do
    assert_difference('PatentProtocol.count') do
      post :create, :patent_protocol => @patent_protocol.attributes
    end

    assert_redirected_to patent_protocol_path(assigns(:patent_protocol))
  end

  test "should show patent_protocol" do
    get :show, :id => @patent_protocol.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patent_protocol.to_param
    assert_response :success
  end

  test "should update patent_protocol" do
    put :update, :id => @patent_protocol.to_param, :patent_protocol => @patent_protocol.attributes
    assert_redirected_to patent_protocol_path(assigns(:patent_protocol))
  end

  test "should destroy patent_protocol" do
    assert_difference('PatentProtocol.count', -1) do
      delete :destroy, :id => @patent_protocol.to_param
    end

    assert_redirected_to patent_protocols_path
  end
end

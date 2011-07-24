require 'test_helper'

class PatentsControllerTest < ActionController::TestCase
  setup do
    @patent = patents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patent" do
    assert_difference('Patent.count') do
      post :create, :patent => @patent.attributes
    end

    assert_redirected_to patent_path(assigns(:patent))
  end

  test "should show patent" do
    get :show, :id => @patent.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patent.to_param
    assert_response :success
  end

  test "should update patent" do
    put :update, :id => @patent.to_param, :patent => @patent.attributes
    assert_redirected_to patent_path(assigns(:patent))
  end

  test "should destroy patent" do
    assert_difference('Patent.count', -1) do
      delete :destroy, :id => @patent.to_param
    end

    assert_redirected_to patents_path
  end
end

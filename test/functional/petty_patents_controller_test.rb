require 'test_helper'

class PettyPatentsControllerTest < ActionController::TestCase
  setup do
    @petty_patent = petty_patents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:petty_patents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create petty_patent" do
    assert_difference('PettyPatent.count') do
      post :create, :petty_patent => @petty_patent.attributes
    end

    assert_redirected_to petty_patent_path(assigns(:petty_patent))
  end

  test "should show petty_patent" do
    get :show, :id => @petty_patent.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @petty_patent.to_param
    assert_response :success
  end

  test "should update petty_patent" do
    put :update, :id => @petty_patent.to_param, :petty_patent => @petty_patent.attributes
    assert_redirected_to petty_patent_path(assigns(:petty_patent))
  end

  test "should destroy petty_patent" do
    assert_difference('PettyPatent.count', -1) do
      delete :destroy, :id => @petty_patent.to_param
    end

    assert_redirected_to petty_patents_path
  end
end

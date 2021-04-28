require "test_helper"

class CreatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create = creates(:one)
  end

  test "should get index" do
    get creates_url
    assert_response :success
  end

  test "should get new" do
    get new_create_url
    assert_response :success
  end

  test "should create create" do
    assert_difference('Create.count') do
      post creates_url, params: { create: { Event: @create.Event, description: @create.description, location: @create.location, title: @create.title } }
    end

    assert_redirected_to create_url(Create.last)
  end

  test "should show create" do
    get create_url(@create)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_url(@create)
    assert_response :success
  end

  test "should update create" do
    patch create_url(@create), params: { create: { Event: @create.Event, description: @create.description, location: @create.location, title: @create.title } }
    assert_redirected_to create_url(@create)
  end

  test "should destroy create" do
    assert_difference('Create.count', -1) do
      delete create_url(@create)
    end

    assert_redirected_to creates_url
  end
end

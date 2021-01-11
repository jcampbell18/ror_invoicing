require "test_helper"

class ImageTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_type = image_types(:one)
  end

  test "should get index" do
    get image_types_url
    assert_response :success
  end

  test "should get new" do
    get new_image_type_url
    assert_response :success
  end

  test "should create image_type" do
    assert_difference('ImageType.count') do
      post image_types_url, params: { image_type: { name: @image_type.name } }
    end

    assert_redirected_to image_type_url(ImageType.last)
  end

  test "should show image_type" do
    get image_type_url(@image_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_type_url(@image_type)
    assert_response :success
  end

  test "should update image_type" do
    patch image_type_url(@image_type), params: { image_type: { name: @image_type.name } }
    assert_redirected_to image_type_url(@image_type)
  end

  test "should destroy image_type" do
    assert_difference('ImageType.count', -1) do
      delete image_type_url(@image_type)
    end

    assert_redirected_to image_types_url
  end
end

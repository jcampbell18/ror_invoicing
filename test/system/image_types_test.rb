require "application_system_test_case"

class ImageTypesTest < ApplicationSystemTestCase
  setup do
    @image_type = image_types(:one)
  end

  test "visiting the index" do
    visit image_types_url
    assert_selector "h1", text: "Image Types"
  end

  test "creating a Image type" do
    visit image_types_url
    click_on "New Image Type"

    fill_in "Name", with: @image_type.name
    click_on "Create Image type"

    assert_text "Image type was successfully created"
    click_on "Back"
  end

  test "updating a Image type" do
    visit image_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @image_type.name
    click_on "Update Image type"

    assert_text "Image type was successfully updated"
    click_on "Back"
  end

  test "destroying a Image type" do
    visit image_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Image type was successfully destroyed"
  end
end

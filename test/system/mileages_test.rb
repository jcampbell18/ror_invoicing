require "application_system_test_case"

class MileagesTest < ApplicationSystemTestCase
  setup do
    @mileage = mileages(:one)
  end

  test "visiting the index" do
    visit mileages_url
    assert_selector "h1", text: "Mileages"
  end

  test "creating a Mileage" do
    visit mileages_url
    click_on "New Mileage"

    fill_in "Drive date", with: @mileage.drive_date
    fill_in "End mileage", with: @mileage.end_mileage
    fill_in "Invoice", with: @mileage.invoice_id
    fill_in "Notes", with: @mileage.notes
    fill_in "Project site", with: @mileage.project_site_id
    fill_in "Start mileage", with: @mileage.start_mileage
    fill_in "Subtotal", with: @mileage.subtotal
    fill_in "Vehicle", with: @mileage.vehicle_id
    click_on "Create Mileage"

    assert_text "Mileage was successfully created"
    click_on "Back"
  end

  test "updating a Mileage" do
    visit mileages_url
    click_on "Edit", match: :first

    fill_in "Drive date", with: @mileage.drive_date
    fill_in "End mileage", with: @mileage.end_mileage
    fill_in "Invoice", with: @mileage.invoice_id
    fill_in "Notes", with: @mileage.notes
    fill_in "Project site", with: @mileage.project_site_id
    fill_in "Start mileage", with: @mileage.start_mileage
    fill_in "Subtotal", with: @mileage.subtotal
    fill_in "Vehicle", with: @mileage.vehicle_id
    click_on "Update Mileage"

    assert_text "Mileage was successfully updated"
    click_on "Back"
  end

  test "destroying a Mileage" do
    visit mileages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mileage was successfully destroyed"
  end
end

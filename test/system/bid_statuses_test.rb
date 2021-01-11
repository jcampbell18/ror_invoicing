require "application_system_test_case"

class BidStatusesTest < ApplicationSystemTestCase
  setup do
    @bid_status = bid_statuses(:one)
  end

  test "visiting the index" do
    visit bid_statuses_url
    assert_selector "h1", text: "Bid Statuses"
  end

  test "creating a Bid status" do
    visit bid_statuses_url
    click_on "New Bid Status"

    fill_in "Name", with: @bid_status.name
    click_on "Create Bid status"

    assert_text "Bid status was successfully created"
    click_on "Back"
  end

  test "updating a Bid status" do
    visit bid_statuses_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bid_status.name
    click_on "Update Bid status"

    assert_text "Bid status was successfully updated"
    click_on "Back"
  end

  test "destroying a Bid status" do
    visit bid_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bid status was successfully destroyed"
  end
end

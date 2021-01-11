require "application_system_test_case"

class ProjectSitesTest < ApplicationSystemTestCase
  setup do
    @project_site = project_sites(:one)
  end

  test "visiting the index" do
    visit project_sites_url
    assert_selector "h1", text: "Project Sites"
  end

  test "creating a Project site" do
    visit project_sites_url
    click_on "New Project Site"

    fill_in "Access code", with: @project_site.access_code
    fill_in "Address", with: @project_site.address
    fill_in "City", with: @project_site.city
    fill_in "Map link", with: @project_site.map_link
    fill_in "State", with: @project_site.state_id
    fill_in "Zipcode", with: @project_site.zipcode
    click_on "Create Project site"

    assert_text "Project site was successfully created"
    click_on "Back"
  end

  test "updating a Project site" do
    visit project_sites_url
    click_on "Edit", match: :first

    fill_in "Access code", with: @project_site.access_code
    fill_in "Address", with: @project_site.address
    fill_in "City", with: @project_site.city
    fill_in "Map link", with: @project_site.map_link
    fill_in "State", with: @project_site.state_id
    fill_in "Zipcode", with: @project_site.zipcode
    click_on "Update Project site"

    assert_text "Project site was successfully updated"
    click_on "Back"
  end

  test "destroying a Project site" do
    visit project_sites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project site was successfully destroyed"
  end
end

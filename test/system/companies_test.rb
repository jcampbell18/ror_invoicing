require "application_system_test_case"

class CompaniesTest < ApplicationSystemTestCase
  setup do
    @company = companies(:one)
  end

  test "visiting the index" do
    visit companies_url
    assert_selector "h1", text: "Companies"
  end

  test "creating a Company" do
    visit companies_url
    click_on "New Company"

    fill_in "Address", with: @company.address
    fill_in "Business name", with: @company.business_name
    fill_in "City", with: @company.city
    fill_in "Company category", with: @company.company_category_id
    fill_in "Contact name", with: @company.contact_name
    fill_in "Email", with: @company.email
    fill_in "Fax", with: @company.fax
    fill_in "Image", with: @company.image_id
    fill_in "Phone", with: @company.phone
    fill_in "Phone ext", with: @company.phone_ext
    fill_in "State", with: @company.state_id
    fill_in "Website", with: @company.website
    fill_in "Zipcode", with: @company.zipcode
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "updating a Company" do
    visit companies_url
    click_on "Edit", match: :first

    fill_in "Address", with: @company.address
    fill_in "Business name", with: @company.business_name
    fill_in "City", with: @company.city
    fill_in "Company category", with: @company.company_category_id
    fill_in "Contact name", with: @company.contact_name
    fill_in "Email", with: @company.email
    fill_in "Fax", with: @company.fax
    fill_in "Image", with: @company.image_id
    fill_in "Phone", with: @company.phone
    fill_in "Phone ext", with: @company.phone_ext
    fill_in "State", with: @company.state_id
    fill_in "Website", with: @company.website
    fill_in "Zipcode", with: @company.zipcode
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "destroying a Company" do
    visit companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company was successfully destroyed"
  end
end

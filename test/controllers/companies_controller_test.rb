require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { address: @company.address, business_name: @company.business_name, city: @company.city, company_category_id: @company.company_category_id, contact_name: @company.contact_name, email: @company.email, fax: @company.fax, image_id: @company.image_id, phone: @company.phone, phone_ext: @company.phone_ext, state_id: @company.state_id, website: @company.website, zipcode: @company.zipcode } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { address: @company.address, business_name: @company.business_name, city: @company.city, company_category_id: @company.company_category_id, contact_name: @company.contact_name, email: @company.email, fax: @company.fax, image_id: @company.image_id, phone: @company.phone, phone_ext: @company.phone_ext, state_id: @company.state_id, website: @company.website, zipcode: @company.zipcode } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end

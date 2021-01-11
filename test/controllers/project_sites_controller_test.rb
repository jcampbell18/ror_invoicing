require "test_helper"

class ProjectSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_site = project_sites(:one)
  end

  test "should get index" do
    get project_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_project_site_url
    assert_response :success
  end

  test "should create project_site" do
    assert_difference('ProjectSite.count') do
      post project_sites_url, params: { project_site: { access_code: @project_site.access_code, address: @project_site.address, city: @project_site.city, map_link: @project_site.map_link, state_id: @project_site.state_id, zipcode: @project_site.zipcode } }
    end

    assert_redirected_to project_site_url(ProjectSite.last)
  end

  test "should show project_site" do
    get project_site_url(@project_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_site_url(@project_site)
    assert_response :success
  end

  test "should update project_site" do
    patch project_site_url(@project_site), params: { project_site: { access_code: @project_site.access_code, address: @project_site.address, city: @project_site.city, map_link: @project_site.map_link, state_id: @project_site.state_id, zipcode: @project_site.zipcode } }
    assert_redirected_to project_site_url(@project_site)
  end

  test "should destroy project_site" do
    assert_difference('ProjectSite.count', -1) do
      delete project_site_url(@project_site)
    end

    assert_redirected_to project_sites_url
  end
end

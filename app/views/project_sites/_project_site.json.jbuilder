json.extract! project_site, :id, :address, :city, :state_id, :zipcode, :access_code, :map_link, :created_at, :updated_at
json.url project_site_url(project_site, format: :json)

json.extract! company, :id, :company_category_id, :business_name, :contact_name, :address, :city, :state_id, :zipcode, :phone, :phone_ext, :fax, :email, :website, :image_id, :created_at, :updated_at
json.url company_url(company, format: :json)

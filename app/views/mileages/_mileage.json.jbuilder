json.extract! mileage, :id, :project_site_id, :vehicle_id, :invoice_id, :drive_date, :start_mileage, :end_mileage, :subtotal, :notes, :created_at, :updated_at
json.url mileage_url(mileage, format: :json)

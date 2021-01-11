json.extract! image, :id, :image_type_id, :filename, :title, :file_path, :created_at, :updated_at
json.url image_url(image, format: :json)

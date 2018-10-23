json.extract! image, :id, :file, :label, :created_at, :updated_at
json.url image_url(image, format: :json)

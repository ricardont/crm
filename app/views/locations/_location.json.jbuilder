json.extract! location, :id, :name, :country, :state, :city, :street, :address_number, :phone, :lat, :long, :created_at, :updated_at
json.url location_url(location, format: :json)

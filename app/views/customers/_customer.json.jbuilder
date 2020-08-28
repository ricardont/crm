json.extract! customer, :id, :name, :phone, :email, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)

json.extract! appointment, :id, :duration, :user_id, :customer_id, :location_id, :product_id, :created_at, :updated_at 
json.start appointment.date_time   
json.end appointment.date_time_end
json.url appointment_url(appointment, format: :html) 
json.url_json appointment_url(appointment, format: :json) 




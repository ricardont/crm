# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Appointment.destroy_all
100.times do |i|
    # date_time_start = Time.between_dates(from: Date.today - 30, to: Date.today + 30, period: :afternoon)
    d =  Time.parse(Faker::Time.between_dates(from: DateTime.now - 30, to: DateTime.now + 30 , period: :afternoon, format: :default))
    dph = d + 1.hour
    # Faker::Time.between_dates(from: Date.today, to: Date.today + 20, period: :morning)

    # Appointment.date_range(d, dph)
    app_exist = Appointment.where("date_time >= ? AND date_time <= ?", d, dph)
    
    # p app_exist[0].user_id
    # unless app_exist
        p d
        p dph
        p '================================================================'
        appointment = Appointment.create!( 
            date_time: "#{d.to_date} #{d.strftime("%H:%M:%S")}"  ,
            duration: 30 ,
            user_id: 1 ,
            customer_id:  2,
            location_id: 3 ,
            product_id:  rand(1..2)
        )
        appointment.save!
    # end
end    



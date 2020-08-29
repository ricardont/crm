class Appointment < ApplicationRecord
    validates :date_time, presence: true
    belongs_to :user 
    belongs_to :location 
    belongs_to :customer
    def date_time_end
        date_time + duration.minute  if date_time
    end    
    def date_human(lang='es')
        if date_time?
            day_of_week_short = %w{Dumm Lun Mar Mier Jue Vie Sab Dom }[date_time.strftime("%u").to_i]
            doy_of_month = date_time.strftime("%d")
            month_short = %w{Dumm Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic}[date_time.strftime("%m").to_i]
            year = date_time.strftime("%Y")        
            "#{day_of_week_short} #{doy_of_month} #{month_short} #{year}"
        end
    end
    def time_human(format='meridian')  
        if date_time?
            "#{date_time.strftime("%I:%M %p")}"
        end
   end
    def date_time_human(lang='es')
        if date_time?
            day_of_week_short = %w{Dumm Lun Mar Mier Jue Vie Sab Dom }[date_time.strftime("%u").to_i]
            doy_of_month = date_time.strftime("%d")
            month_short = %w{Dumm Ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic}[date_time.strftime("%m").to_i]
            year = date_time.strftime("%Y")
            time_meridian = date_time.strftime("%I:%M %p")         
            "#{day_of_week_short} #{doy_of_month} #{month_short} #{year}, #{time_meridian}"
        end
   end
end

module ApplicationHelper
 def get24AverageByHoursForArea
    pm10 = {}
    pm25 = {}
    Measurement.where(measured_at: (Time.now - 23.hours)..Time.now).order(created_at: :asc).group_by{ |s| s.measured_at.in_time_zone("Warsaw").hour }.each do |h, m|
      sum10 = 0
      sum25 = 0
      m.each do |p|
        sum10 += p.pm10
        sum25 += p.pm25
      end
      # pm10[h] = sum10/m.length
      pm10[h] = sum10/m.length
      pm25[h] = sum25/m.length
    end
    return pm10, pm25
  end

end

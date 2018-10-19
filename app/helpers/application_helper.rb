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

  def getColor pm10, pm25
    result = ""
    if pm10 <= 20 && pm25 <= 12
      result = "<td>Bardzo dobrze</td><td><i class='flag very-good'></i></td>"
    end
    if (pm10 > 20 && pm10 <= 50) || (pm25 > 12 && pm25 <= 36)
      result = "<td>Dobrze</td><td><i class='flag good'></i></td>"
    end
    if (pm10 > 50 && pm10 <= 100) || (pm25 > 36 && pm25 <= 60)
      result = "<td>Umiarkowanie</td><td><i class='flag moderate'></i></td>"
    end
    if (pm10 > 100 && pm10 <= 140) || (pm25 > 60 && pm25 <= 84)
      result = "<td>Dostatecznie</td><td><i class='flag enough'></i></td>"
    end
    if (pm10 > 140 && pm10 <= 200) || (pm25 > 84 && pm25 <= 120)
      result = "<td>Źle</td><td><i class='flag bad'></i></td>"
    end
    if pm10 > 200 || pm25 > 120
      result = "<td>Bardzo źle</td><td><i class='flag mortal'></i></td>"
    end
    result.html_safe
  end


  def get24AverageByHoursForInstallation(installation_id)
    # installation = Installation.find_by(sensor_id: sensor_id)
    pm10 = {}
    pm25 = {}
    Measurement.where(installation_id: installation_id).where(measured_at: (Time.now - 23.hours)..Time.now).order(created_at: :asc).group_by{ |s| s.measured_at.in_time_zone("Warsaw").hour }.each do |h, m|
      sum10 = 0
      sum25 = 0
      m.each do |p|
        sum10 += p.pm10
        sum25 += p.pm25
      end
      pm10[h] = sum10/m.length
      pm25[h] = sum25/m.length
    end
    return pm10
  end


end

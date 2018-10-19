class DashboardController < ApplicationController
  include ApplicationHelper
  
  def index
    @installations_count = Installation.count

		live = []
    Measurement.last(2000).group_by{ |s| s.installation_id }.each do |s, m|
      live.push(m.last) if m.last.created_at > 3.hours.ago
    end
    @live = live.sort_by{|m| -m[:pm10]}

    @area10, @area25 = get24AverageByHoursForArea


    @multichart_live = []

    Installation.all.each do |i|
      @multichart_live.push(i.name)
      @multichart_live.push(get24AverageByHoursForInstallation(i.id).values.map { |v| v.round })
    end
    puts @multichart_live

    @multichart_live.unshift(get24AverageByHoursForInstallation(Installation.first.id).keys.map{|v| v})
    @multichart_live.unshift("live")


  end

  def about
  	
  end
end

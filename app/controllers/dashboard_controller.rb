class DashboardController < ApplicationController
  include ApplicationHelper
  def index
		live = []
    Measurement.last(2000).group_by{ |s| s.installation_id }.each do |s, m|
      live.push(m.last) if m.last.created_at > 3.hours.ago
    end
    @live = live.sort_by{|m| -m[:pm10]}

    @area10, @area25 = get24AverageByHoursForArea
  end

  def about
  	
  end
end

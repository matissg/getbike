module RidesHelper

  def status_for(ride)
    if ride.end_at < Time.current
      'ended'
    elsif ride.start_at > Time.current
      'booked'
    elsif (ride.start_at < Time.current) && (ride.end_at > Time.current)
      'now'
    end
  end

  def closest_ride_time
    case Time.current.wday
    when 0
      start = 1.day.from_now.beginning_of_day
      "#{(start + 8.hours).strftime("%d.%m.%Y %H:%M")} - #{(start + 12.hours).strftime("%d.%m.%Y %H:%M")}"
    when 6
      start = 2.days.from_now.beginning_of_day
      "#{(start + 8.hours).strftime("%d.%m.%Y %H:%M")} - #{(start + 12.hours).strftime("%d.%m.%Y %H:%M")}"
    else
      "#{5.minutes.from_now.strftime("%d.%m.%Y %H:%M")} - #{4.hours.from_now.strftime("%d.%m.%Y %H:%M")}"
    end
  end

end

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

end

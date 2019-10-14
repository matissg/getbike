module BikesHelper

  def next_bike_number
    Bike.last.number.split('_').last.to_i + 1
  end

end

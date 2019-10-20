class RidesController < ApplicationController
  helper_method :ride

  # GET /rides
  def index
    @pagy, @rides = pagy(Ride.includes(:employee, :bike)
                             .references(:employees, :bikes))
  end

  # GET /rides/new
  def new
    @ride = Ride.new
  end

  # GET /rides/1/edit
  def edit
  end

  # POST /rides
  def create
    ride = Ride.new(ride_params)

    if free_bike.present? && ride.save
      redirect_to employee_path(ride.employee_id)
      flash[:success] = 'Ride was successfully created.'
    else
      flash_error_for(ride)
      render partial: 'shared/flash', status: 422
    end
  end

  # PATCH/PUT /rides/1
  def update
    if free_bike.present? && ride.update(ride_params)
      redirect_to employee_path(ride.employee_id)
      flash[:success] = 'Ride was successfully updated.'
    else
      flash_error_for(ride)
      render partial: 'shared/flash', status: 422
    end
  end

  # DELETE /rides/1
  def destroy
    if ride.destroy
      redirect_to rides_path
      flash[:info] = 'Ride was successfully destroyed.'
    end
  end

  private

    def ride
      @ride ||= Ride.find(params[:id])
    end

    def free_bike
      @free_bike ||= Bike.first_available_for_time(params[:ride][:starts_ends])
    end

    def ride_params
      params.require(:ride).permit(:employee_id, :starts_ends).merge(bike_id: free_bike)
    end
end

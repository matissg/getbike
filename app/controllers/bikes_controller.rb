class BikesController < ApplicationController
  helper_method :bike

  # GET /bikes
  def index
    if params[:range].present?
      render json: Bike.availability_message(params[:range]).to_json
    else
      @pagy, @bikes = pagy(Bike.with_discarded.includes(:rides).references(:rides))
    end
  end

  # GET /bikes/1
  def show
    @pagy, @rides = pagy(bike.rides.with_discarded
                             .includes(:employee).references(:employees))
  end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit
  end

  # POST /bikes
  def create
    bike = Bike.new(bike_params)

    if bike.save
      redirect_to bikes_path
      flash[:success] = "Bike #{bike.number} was successfully created."
    else
      flash_error_for(bike)
      render partial: 'shared/flash', status: 422
    end
  end

  # PATCH/PUT /bikes/1
  def update
    if bike.update(bike_params)
      redirect_to bikes_path
      flash[:success] = "Bike #{bike.number} was successfully updated."
    else
      flash_error_for(bike)
      render partial: 'shared/flash', status: 422
    end
  end

  # DELETE /bikes/1
  def destroy
    if bike.discard
      redirect_to bikes_path
      flash[:info] = "Bike #{bike.number} was successfully destroyed."
    end
  end

  private

    def bike
      @bike ||= Bike.find(params[:id])
    end

    def bike_params
      params.require(:bike).permit(:number)
    end
end

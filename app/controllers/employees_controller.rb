class EmployeesController < ApplicationController
  helper_method :employee

  # GET /employees
  def index
    @pagy, @employees = pagy(
      Employee.with_discarded.includes(:rides).order('rides.created_at')
                             .references(:rides)
    )
  end

  # GET /employees/1
  def show
    @pagy, @rides = pagy(
      employee.rides.order(updated_at: :desc).includes(:bike).references(:bikes)
    )
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    employee = Employee.new(employee_params)

    if employee.save
      redirect_to employees_path
      flash[:success] = "#{employee.name} was added!"
    else
      flash_error_for(employee)
      render partial: 'shared/flash'
    end
  end

  # PATCH/PUT /employees/1
  def update
    if employee.update(employee_params)
      redirect_to employees_path
      flash[:success] = "#{employee.name} was updated!"
    else
      flash_error_for(employee)
      render partial: 'shared/flash'
    end
  end

  # DELETE /employees/1
  def destroy
    if employee.discard
      redirect_to employees_path
      flash[:info] = "#{employee.name} was deleted!"
    end
  end

  private

    def employee
      @employee ||= Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:name)
    end
end

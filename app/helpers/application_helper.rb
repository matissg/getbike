module ApplicationHelper
  include Pagy::Frontend

  def is_active_controller(controller_name, class_name = nil)
    if controller_name.include? params[:controller]
      class_name == nil ? "active" : class_name
    else
      nil
    end
  end

  def list_of_employees
    Employee.kept.pluck(:name, :id)
  end

end

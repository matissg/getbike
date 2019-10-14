class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include Pagy::Backend, Flasher

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  private

  def not_found_error
    redirect_to root_path
    flash[:warning] = 'Oops, we cannot find you are looking for!'
  end

end

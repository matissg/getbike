module Flasher
  extend ActiveSupport::Concern

  def flash_error_for(object)
    flash.now[:danger] = object.errors.full_messages.join(', ')
  end

end

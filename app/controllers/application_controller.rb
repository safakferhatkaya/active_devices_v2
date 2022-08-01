class ApplicationController < ActionController::Base
  before_action :set_current_device
  def set_current_device
    if session[:device_id]
      @current_device = Device.find(session[:device_id])
    end
  end
end

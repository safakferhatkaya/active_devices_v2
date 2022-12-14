class ApplicationController < ActionController::Base
  before_action :set_current_device
  #after_action :update_device_online_status

  before_action :set_last_online, if: proc { @current_device && (session[:last_online] == nil || session[:last_online] < 15.minutes.ago) }

  def set_current_device
    if session[:device_id]
      @current_device = Device.find(session[:device_id])
    end
  end

  private
  # def update_device_online_status
  #   if @current_device && @current_device.last_online.to_i < 2.minutes.ago.to_i
  #     @current_device.update(is_active: true)
  #   end
  # end

  def set_last_online
    @current_device.update_attribute(:last_online, Time.current)
    session[:last_online] = Time.current
  end
end

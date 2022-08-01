class DevicesController < ApplicationController

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    if @device.save
      redirect_to root_path, notice: "Device created!"
    else
      render :new
    end
  end

  private
  def device_params
    params.require(:device).permit(:reference)
  end
end
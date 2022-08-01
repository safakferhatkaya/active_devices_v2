class DevicesController < ApplicationController

  def index
    @devices = Device.where(user_id: current_user.id)
  end
  
  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    if @device.save
      #show credentials once with turbo
      redirect_to devices_path, notice: "Device created!"
      
    else
      render :new
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path, notice: "Device deleted!"
  end

  private
  def device_params
    params.require(:device).permit(:name, :notes)
  end
end
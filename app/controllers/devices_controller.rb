class DevicesController < ApplicationController
  after_action :update_is_credentials_showed, only: [:credentials]
  def index
    @devices = Device.where(user_id: current_user.id).order(id: :desc)
  end
  
  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current_user.id
    if @device.save
      #show credentials once with turbo
      respond_to do |format|
        #format.turbo_stream { render turbo_stream: turbo_stream.prepend('devices', partial: 'devices/devices_list', locals: {device: @device}) }
        format.html { redirect_to devices_path }
        format.js
      end
    else
      render :new
    end
  end

  def credentials
    set_device
    respond_to do |format|
      format.js
    end
  end

  def destroy
    set_device
    @device.destroy
    respond_to do |format|
      #format.turbo_stream { render turbo_stream: turbo_stream.remove(@device)}
      format.html { redirect_to devices_path }
    end
  end

  private
  def device_params
    params.require(:device).permit(:name, :notes)
  end

  def set_device
    @device = Device.find(params[:id])
  end

  def update_is_credentials_showed
    @device.update(is_credentials_showed: true)
  end
end
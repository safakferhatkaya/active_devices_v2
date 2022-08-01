class RegistrationsController < ApplicationController
  def new
    @device = Device.new
  end

  def create
    @device = Device.find_by(reference: params[:device][:reference])
    if @device && @device.authenticate(params[:device][:password])
      session[:device_id] = @device.id
      redirect_to root_path
    else
      render :new
    end
  end
end
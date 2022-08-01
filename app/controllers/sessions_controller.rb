class SessionsController < ApplicationController

  def new
    @device = Device.new
  end

  def create
    @device = Device.find_by(reference: params[:reference])
    if @device && @device.authenticate(params[:password])
      session[:device_id] = @device.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:device_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
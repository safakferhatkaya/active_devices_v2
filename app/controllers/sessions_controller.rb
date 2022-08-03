class SessionsController < ApplicationController

  def new
    @device = Device.new
  end

  def create
    @device = Device.find_by(reference: params[:reference])
    if @device && @device.password = params[:password]#@device.authenticate(params[:password])
      session[:device_id] = @device.id
      redirect_to root_path, notice: "Welcome Dear Device!"
    else
      render :new
    end
  end

  def destroy
    #burada boolean is_active false yapılabilir
    session[:device_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
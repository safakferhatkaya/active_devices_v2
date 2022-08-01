class HomeController < ApplicationController
  def index
    if @current_device
      @devices = Device.where(is_active: true)
    end

  end
end

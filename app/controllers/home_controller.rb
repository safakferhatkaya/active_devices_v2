class HomeController < ApplicationController
  def index
    if @current_device
      @devices = Device.where("last_online > ?", 5.minutes.ago).order(id: :desc)
    end
  end
end

class LocationsController < ApplicationController
  before_action :set_event

  def new
    @location = @event.build_location
  end

  def create
    @location = @event.build_location(location_params)
    if @location.save
      redirect_to event_path(@event)
    else
      render "new"
    end
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end

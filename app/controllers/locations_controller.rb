class LocationsController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
  end
end

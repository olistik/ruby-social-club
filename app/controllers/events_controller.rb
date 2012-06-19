class EventsController < ApplicationController
  def index
    @events = Event.incoming
  end

  def toggle_subscription
    Event.find(params[:id]).toggle_subscription(current_user)
    redirect_to :back
  end
end

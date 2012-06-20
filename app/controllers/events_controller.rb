class EventsController < ApplicationController
  def index
    @past = params[:past]
    @events = @past ? Event.past : Event.incoming
  end

  def toggle_subscription
    Event.find(params[:id]).toggle_subscription(current_user)
    redirect_to :back
  end
end

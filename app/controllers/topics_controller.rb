class TopicsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
  end

  def show
    @topic = Topic.find(params[:id])
  end
end

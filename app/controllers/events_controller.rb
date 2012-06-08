class EventsController < ApplicationController
  inherit_resources
  actions :index
  custom_actions resource: :toggle_subscription

  def toggle_subscription
    resource.toggle_subscription(current_user)
    redirect_to :back
  end
end

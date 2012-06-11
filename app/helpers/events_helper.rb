require 'uri'

module EventsHelper

  def event_button(event, subscribed)
    link_to event.start.to_date.to_s, event_topics_path(event), class: "btn btn-large #{subscribed ? 'btn-primary' : ''}"
  end

  def event_users_status(users)
    if users.count < 3
      image_tag "event-status/#{users.count}.jpeg", class: 'users status'
    end
  end
end

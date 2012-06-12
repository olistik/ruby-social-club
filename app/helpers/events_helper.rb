require 'uri'

module EventsHelper

  def event_button(event, subscribed)
    label = event.start.to_date.to_s
    if event.users.count > 0
      label += content_tag(:span, event.users.count, class: 'badge badge-inverse')
    end
    link_to label.html_safe, event_topics_path(event), class: "btn btn-large #{subscribed ? 'btn-primary' : ''}"
  end

  def event_users_status(users)
    if users.count < 3
      image_tag "event-status/#{users.count}.jpeg", class: 'users status'
    end
  end
end

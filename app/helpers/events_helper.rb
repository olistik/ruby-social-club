require 'uri'

module EventsHelper

  def event_button(event, subscribed)
    link_to event.start.to_date.to_s, event_path(event), class: "btn btn-large #{subscribed ? 'btn-primary' : ''}"
  end

  def subscription_button(event, options = {})
    label = options[:subscribe] ? 'subscribe me' : 'remove me'
    label += content_tag(:i, '', class: "icon-#{options[:subscribe] ? 'ok' : 'remove'} icon-white").html_safe
    disabled_class = options[:enabled] ? '' : 'disabled'
    button_type = options[:subscribe] ? 'primary' : 'warning'
    link_to label.html_safe, toggle_subscription_event_path(event), method: :post, class: "btn btn-large btn-#{button_type} #{disabled_class}"
  end

  def event_users_status(users)
    if users.count < 3
      image_tag "event-status/#{users.count}.jpeg", class: 'users_status'
    end
  end

  def event_gmap_image(event)
    address = URI::encode event.location.address
    size = '400x300'
    src = "http://maps.googleapis.com/maps/api/staticmap?zoom=16&size=#{size}&maptype=roadmap&markers=icon:http://goo.gl/5lqnL%7Cshadow:true%7C#{address}&sensor=false"
    image_tag src, size: size, alt: event.location.address, class: 'gmap'
  end
end

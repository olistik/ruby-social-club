class EventCell < Cell::Rails
  helper EventsHelper

  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::UrlHelper
  include Cells::Rails::ActionController

  SECTIONS = %w[topics users location]

  def controller(parent = parent_controller)
    parent.kind_of?(ApplicationController) ? parent : controller(parent.parent_controller)
  end

  def section(event, active_section, section_content)
    @event = event
    @active_section = active_section
    @sections = SECTIONS
    set_metas(@event, @active_section)
    @section_content = section_content
    render
  end

  def set_metas(event, section)
    title = "Event: #{event.start.to_date.to_s} > #{section.to_s.humanize}"
    options = {
      title: title,
      open_graph: {
        title: title,
        url: request.url
      }
    }
    controller.send :set_meta_tags, options
  end

  def topics(event, selected = nil)
    @event = event
    @selected = selected
    render
  end

  def users(event)
    @event = event
    render
  end

  def location(event)
    @event = event
    render
  end

  def gmap_image(event)
    address = URI::encode event.location.address
    size = '400x300'
    src = "http://maps.googleapis.com/maps/api/staticmap?zoom=16&size=#{size}&maptype=roadmap&markers=icon:http://goo.gl/5lqnL%7Cshadow:true%7C#{address}&sensor=false"
    image = image_tag src, size: size, alt: event.location.address, class: 'gmap'
    render inline: image
  end

  def subscribe_button(event)
    enable = controller.logged_in?
    subscribe = !controller.logged_in? || controller.logged_in? && !controller.current_user.subscribed?(event)
    label = subscribe ? 'subscribe me' : 'remove me'
    label += content_tag(:i, '', class: "icon-#{subscribe ? 'ok' : 'remove'} icon-white")
    disabled_class = enable ? '' : 'disabled'
    button_type = subscribe ? 'primary' : 'warning'
    html_class = "btn btn-large btn-#{button_type} #{disabled_class}"
    link = toggle_subscription_event_path(event)
    render inline: link_to(label.html_safe, link, method: :post, class: html_class)
  end
end

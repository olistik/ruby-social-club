class EventCell < Cell::Rails
  helper EventsHelper
  include ActionView::Helpers::AssetTagHelper

  def controller
    parent_controller
  end

  def section(event, active_section)
    @event = event
    @active_section = active_section
    @sections = %w[topics users location]
    render
  end

  def topics(event)
    @event = event
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
end

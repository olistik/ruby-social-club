module ApplicationHelper
  def site_metas
    display_meta_tags(
      site: 'Ruby Social Club',
      description: 'Let\'s code and have fun',
      open_graph: {
        title: 'Ruby Social Club',
        url:   request.base_url,
        image: "#{request.base_url}/assets/logo.jpeg"
      }
    )
  end
end

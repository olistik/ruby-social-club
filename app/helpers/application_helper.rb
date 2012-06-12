module ApplicationHelper
  def site_metas
    display_meta_tags(
      site: 'Ruby Social Club',
      description: 'Let\'s code and have fun',
      open_graph: {
        title: 'Ruby Social Club',
        url:   'http://www.rubysocialclub.com',
        image: 'http://www.rubysocialclub.com/assets/logo.jpeg'
      }
    )
  end
end

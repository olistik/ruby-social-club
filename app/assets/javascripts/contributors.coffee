$ ->
  if contributors = $('.credits.developers')
    $.ajax
      type: 'GET',
      dataType: 'jsonp json',
      url: 'https://api.github.com/repos/olistik/ruby-social-club/contributors',
      success: (response) ->
        console.log response.data
        $.each response.data, ->
          contributor = $('<a>')
          contributor.attr 'href', this.url
          avatar = new Image()
          avatar.src = this.avatar_url
          contributor.append $(avatar)
          contributors.find('ul').append contributor

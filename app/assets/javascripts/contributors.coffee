$ ->
  contributors = $('.credits.developers ul')
  if contributors.length
    $.ajax
      type:     'GET',
      dataType: 'jsonp json',
      url:      'https://api.github.com/repos/olistik/ruby-social-club/contributors',
      success: (response) ->
        $.each response.data, ->
          contributor = $("<a href=\"#{this.url}\">")
          avatar      = $("<img src=\"#{this.avatar_url}\"}>")
          contributor.append avatar
          contributors.append contributor

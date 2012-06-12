$ ->
  contributors = $('.credits.developers ul')
  if contributors.length
    $.ajax
      type:     'GET',
      dataType: 'jsonp json',
      url:      'https://api.github.com/repos/olistik/ruby-social-club/contributors',
      success: (response) ->
        $.each response.data, ->
          contributor = $('<li>')
          home        = $("<a href=\"#{this.url}\">")
          avatar      = $("<img src=\"#{this.avatar_url}\"}>")
          home.append avatar
          contributor.append home
          contributors.append contributor

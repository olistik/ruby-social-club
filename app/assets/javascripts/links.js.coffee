$ ->
  $('a.disabled').on 'click', (event) ->
    event.preventDefault()
    false

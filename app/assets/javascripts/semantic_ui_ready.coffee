ready = ->
  $('.message .close').on('click',
    -> $(this).closest('.message').hide()
  )

  $('.ui.dropdown').dropdown()

  setTimeout (->
    $('.message .close').closest('.message').hide()
    return
  ), 5000

$(document).ready(ready)
$(document).on('page:load', ready)
# $(document).on('turbolinks:load', ready)

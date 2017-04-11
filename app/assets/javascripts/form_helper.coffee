jQuery ->
  $("user_name").blur (event) ->
    content = $(this).val()
    console.log content
    if content.length < 1
      console.log "error"
    #console.log "in blur"

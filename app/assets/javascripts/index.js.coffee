$ ->
  $(".search").submit (event) ->
      input = $(this).find("input")
      term  = input.val()

      if (term.length < 3)
        input.addClass("error")
        event.preventDefault()
      else
        input.removeClass("error")

App.makepost = App.cable.subscriptions.create "MakepostChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.body.blank?
      $('#posts').append '<div class="post">' + data.body + '</div>'
    scroll_bottom()

scroll_bottom = () ->
  $('#posts').scrollTop($('#posts')[0].scrollHeight)
  console.log(scrollHeight)

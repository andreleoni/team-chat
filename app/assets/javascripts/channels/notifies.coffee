window.notify_unread_messages = (unread_channels, unread_users) ->
  for unread_channel in unread_channels
    $(".open_channel#" + unread_channel['id'] ).addClass('with-unnread-message')

  # for unread_channel in unread_channels
  #   $(".open_channel#" + unread_channel['id'] ).addClass('with-unnread-message')

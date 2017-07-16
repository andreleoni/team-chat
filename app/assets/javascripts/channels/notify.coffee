App.chat = App.cable.subscriptions.create { channel: "NotifyChannel", team_id: $(".team_id").val()},
  received: (data) ->
    window.notify_unread_messages(data.unread_channels, data.unread_users)

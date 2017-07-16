class NotifyBroadcastJob < ApplicationJob
  queue_as :notify

  def perform(message)
    ActionCable.server.broadcast("notify_messages", { })
  end
end

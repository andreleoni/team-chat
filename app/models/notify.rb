class Notify < ApplicationRecord
  belongs_to :notifyable, polymorphic: true
  belongs_to :user

  enum status: [:unread, :read]

  after_create_commit { NotifyBroadcastJob.perform_later self }
end

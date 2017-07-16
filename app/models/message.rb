class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  belongs_to :user
  validates_presence_of :body, :user

  enum status: [ :unread, :read ]

  after_create_commit { MessageBroadcastJob.perform_later self }
end

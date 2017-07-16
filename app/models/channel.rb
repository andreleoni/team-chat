class Channel < ApplicationRecord
  has_many :messages, as: :messagable, :dependent => :destroy
  has_many :notify, as: :notifyable, :dependent => :destroy

  belongs_to :team
  belongs_to :user

  validates_presence_of :slug, :team, :user
  validates :slug, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_uniqueness_of :slug, :scope => :team_id
end

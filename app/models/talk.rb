class Talk < ApplicationRecord
  has_many :messages, as: :messagable, :dependent => :destroy
  has_many :notify, as: :notifyable, :dependent => :destroy

  belongs_to :team
  belongs_to :user_one, :class_name => :User
  belongs_to :user_two, :class_name => :User

  validates_presence_of :user_one, :user_two, :team
end

class User < ApplicationRecord
  has_many :teams
  has_many :messages
  has_many :talks, dependent: :destroy
  has_many :team_users, dependent: :destroy
  has_many :member_teams, through: :team_users, :source => :team
  has_many :active_teams, -> { where("team_users.status = ?", 1) }, through: :team_users, source: :team

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def my_teams
    self.teams + self.active_teams
  end
end

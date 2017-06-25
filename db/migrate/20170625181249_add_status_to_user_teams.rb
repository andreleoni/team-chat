class AddStatusToUserTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :team_users, :status, :integer
  end
end

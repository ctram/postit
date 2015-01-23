class ModifyColumnsOfUserTeams < ActiveRecord::Migration
  def change
    remove_column :user_teams, :club_id
    add_column :user_teams, :team_id, :string
  end
end

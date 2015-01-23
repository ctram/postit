class AddIdsToUserTeams < ActiveRecord::Migration
  def change
    add_column :user_teams, :user_id, :integer
    add_column :user_teams, :club_id, :integer

  end
end

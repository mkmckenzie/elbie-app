class DropTeammatesTeam < ActiveRecord::Migration[5.1]
  def change
    drop_table :teammates_teams
  end
end

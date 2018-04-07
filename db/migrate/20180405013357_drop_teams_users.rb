class DropTeamsUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :teams_users
  end
end

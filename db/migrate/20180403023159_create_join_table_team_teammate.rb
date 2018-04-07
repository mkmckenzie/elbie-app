class CreateJoinTableTeamTeammate < ActiveRecord::Migration[5.1]
  def change
    create_join_table :teams, :teammates do |t|
      t.index [:team_id, :teammate_id]
    end
  end
end

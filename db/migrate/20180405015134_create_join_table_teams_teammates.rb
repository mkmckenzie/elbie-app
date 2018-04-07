class CreateJoinTableTeamsTeammates < ActiveRecord::Migration[5.1]
  def change
    create_join_table :teams, :teammates do |t|
      t.index [:team_id, :teammate_id]
      t.index [:teammate_id, :team_id]
    end
  end
end

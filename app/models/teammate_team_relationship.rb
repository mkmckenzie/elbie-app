class TeammateTeamRelationship < ApplicationRecord
  self.table_name = "teammates_teams"
  belongs_to :teammate
  belongs_to :team
end
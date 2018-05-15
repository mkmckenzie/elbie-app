class Teammate < ApplicationRecord
  has_many :teammate_team_relationships
  has_many :teams, through: :teammate_team_relationships
  accepts_nested_attributes_for :teams

  def claimed?
    claimed_flag == 1
  end

end

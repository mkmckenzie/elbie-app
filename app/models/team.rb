class Team < ApplicationRecord
  belongs_to :user
  has_many :teammate_team_relationships
  has_many :teammates, through: :teammate_team_relationships
  accepts_nested_attributes_for :teammates

  def public?
    public == 1
  end

  def shareable?
    shareable == 1
  end
  
end

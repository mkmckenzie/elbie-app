class AddCreatedByToTeammate < ActiveRecord::Migration[5.1]
  def change
    add_column :teammates, :created_by, :integer
  end
end

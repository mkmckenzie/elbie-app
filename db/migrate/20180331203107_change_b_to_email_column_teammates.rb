class ChangeBToEmailColumnTeammates < ActiveRecord::Migration[5.1]
  def change
    rename_column :teammates, :b, :email_address
  end
end

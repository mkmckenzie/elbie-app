class CreateTeammates < ActiveRecord::Migration[5.1]
  def change
    create_table :teammates do |t|
      t.string :name
      t.string :b
      t.string :primary_phone
      t.string :secondary_phone
      t.string :website
      t.string :instagram_handle
      t.integer :visit_count
      t.string :venmo_handle
      t.string :facebook_page
      t.integer :claimed_flag
      t.text :brand_summary

      t.timestamps
    end
  end
end

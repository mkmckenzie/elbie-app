class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :public
      t.integer :shareable

      t.timestamps
    end
  end
end

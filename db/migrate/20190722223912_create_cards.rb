class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :player_name
      t.string :team
      t.string :number
      t.date :year
      t.integer :user_id
      t.string :condition
      t.timestamps null: false
    end
  end
end

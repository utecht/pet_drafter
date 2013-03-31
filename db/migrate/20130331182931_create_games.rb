class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user
      t.references :opponent
      t.references :team
      t.references :opponent_team
      t.integer :stage

      t.timestamps
    end
    add_index :games, :user_id
    add_index :games, :opponent_id
    add_index :games, :team_id
    add_index :games, :opponent_team_id
  end
end

class CreateLobbies < ActiveRecord::Migration
  def change
    create_table :lobbies do |t|
      t.references :user
      t.timestamp :time
      t.references :team
      t.references :opponent
      t.boolean :accepted
      t.timestamp :challengetime
      t.references :game

      t.timestamps
    end
    add_index :lobbies, :user_id
    add_index :lobbies, :team_id
    add_index :lobbies, :opponent_id
    add_index :lobbies, :game_id
  end
end

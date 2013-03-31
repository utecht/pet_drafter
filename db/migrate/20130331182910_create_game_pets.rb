class CreateGamePets < ActiveRecord::Migration
  def change
    create_table :game_pets do |t|
      t.references :game
      t.references :pet
      t.integer :status

      t.timestamps
    end
    add_index :game_pets, :game_id
    add_index :game_pets, :pet_id
  end
end

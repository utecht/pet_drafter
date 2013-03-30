class CreateTeamPets < ActiveRecord::Migration
  def change
    create_table :team_pets do |t|
      t.references :pet
      t.references :team

      t.timestamps
    end
    add_index :team_pets, :pet_id
    add_index :team_pets, :team_id
  end
end

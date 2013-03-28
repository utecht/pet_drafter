class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :speciesId
      t.integer :level
      t.integer :health
      t.integer :power
      t.integer :speed
      t.references :user

      t.timestamps
    end
    add_index :pets, :user_id
  end
end

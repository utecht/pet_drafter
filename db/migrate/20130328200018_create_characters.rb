class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :server
      t.string :region
      t.references :user

      t.timestamps
    end
    add_index :characters, :user_id
  end
end

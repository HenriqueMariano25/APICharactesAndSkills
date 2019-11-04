class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :character_id
      t.string :name
      t.string :ability
      t.boolean :proficient

      t.timestamps
    end
  end
end

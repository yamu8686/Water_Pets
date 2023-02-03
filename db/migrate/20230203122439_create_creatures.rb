class CreateCreatures < ActiveRecord::Migration[6.1]
  def change
    create_table :creatures do |t|
      t.integer :genre_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :continent
      t.integer :population
      t.string :language
      t.boolean :world_cup

      t.timestamps
    end
  end
end

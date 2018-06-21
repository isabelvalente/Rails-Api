class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.integer :age
      t.integer :country_id

      t.timestamps
    end
  end
end

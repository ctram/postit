class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.timestamps
      t.integer :origin_year
    end
  end
end

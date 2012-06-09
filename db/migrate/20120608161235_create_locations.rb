class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.text :gmap_code
      t.string :gmap_link
      t.timestamps
    end
  end
end

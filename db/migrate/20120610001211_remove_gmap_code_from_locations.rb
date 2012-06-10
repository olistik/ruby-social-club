class RemoveGmapCodeFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :gmap_code
  end

  def down
    add_column :locations, :gmap_code, :text
  end
end

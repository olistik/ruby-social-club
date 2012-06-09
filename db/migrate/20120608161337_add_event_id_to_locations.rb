class AddEventIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :event_id, :integer
  end
end

class AddPositionToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :position, :integer
  end
end

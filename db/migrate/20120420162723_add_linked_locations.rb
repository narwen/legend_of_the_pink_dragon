class AddLinkedLocations < ActiveRecord::Migration
  def change
    add_column(:locations, :north_id, :integer)
    add_column(:locations, :south_id, :integer)
    add_column(:locations, :east_id, :integer)
    add_column(:locations, :west_id, :integer)
  end
end

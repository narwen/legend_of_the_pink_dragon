class Location < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name

  belongs_to :north, class_name: "Location", foreign_key: "north_id"
  belongs_to :south, class_name: "Location", foreign_key: "south_id"
  belongs_to :west, class_name: "Location", foreign_key: "west_id"
  belongs_to :east, class_name: "Location", foreign_key: "east_id"

  def unlinked_locations
    linked_ids = [north_id, south_id, west_id, east_id].compact
    locations = Location.where("id != ?", id)
    if linked_ids.present?
      locations = locations.where("id NOT IN (?)", linked_ids)
    end
    locations
  end
end

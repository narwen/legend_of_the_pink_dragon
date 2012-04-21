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

  def north=(location)
    write_attribute(:north_id, location.id)
    if location.south == self
      save
    else
      location.south = self
    end
  end

  def south=(location)
    write_attribute(:south_id, location.id)
    if location.north == self
      save
    else
      location.north = self
    end
  end

  def west=(location)
    write_attribute(:west_id, location.id)
    if location.east == self
      save
    else
      location.east = self
    end
  end

  def east=(location)
    write_attribute(:east_id, location.id)
    if location.west == self
      save
    else
      location.west = self
    end
  end
end

class LocationLinker
  def self.link_north_south(location_1, location_2)
    unlink_location(location_1, "north")
    unlink_location(location_2, "south")
    location_1.north = location_2
    location_2.south = location_1
    location_1.save && location_2.save
  end

  def self.link_east_west(location_1, location_2)
    unlink_location(location_1, "east")
    unlink_location(location_2, "west")
    location_1.east = location_2
    location_2.west = location_1
    location_1.save && location_2.save
  end

  def self.unlink_location(location, direction)
    inverse = inverse_direction(direction)
    other_location = location.send(direction)
    if other_location
      other_location.send("#{inverse}=", nil)
      other_location.save
    end
  end

  def self.link_locations(primary_location, secondary_location, direction)
    case direction
    when "north"
      link_north_south(primary_location, secondary_location)
    when "south"
      link_north_south(secondary_location, primary_location)
    when "east"
      link_east_west(primary_location, secondary_location)
    when "west"
      link_east_west(secondary_location, primary_location)
    end
  end

  def self.inverse_direction(direction)
    case direction
    when "north"
      "south"
    when "south"
      "north"
    when "west"
      "east"
    when "east"
      "west"
    end
  end
end

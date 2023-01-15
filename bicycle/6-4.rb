class Bicycle
  def initialize(args)
  end
end

class RoadBike < Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  def spares
    {chain: "10-speed", tire_size: "23", tape_color: tape_color}
  end
end

class MountainBike < Bicycle
  attr_reader :front_cushion, :back_cushion

  def initialize(args)
    @front_cushion = args[:front_cushion]
    @back_cushion = args[:back_cushion]
    super(args)
  end

  def spares
    super.merge(back_cushion: back_cushion)
  end
end

road_bike_args = {
  size: "M",
  tape_color: "red"
}

road_bike = RoadBike.new(road_bike_args)

puts road_bike.size # "M"

mountain_bike_args = {
  size: "S",
  front_cushion: "Manitou",
  back_cushion: "Fox"
}

mountain_bike = MountainBike.new(mountain_bike_args)

puts mountain_bike.size # NoMethodError

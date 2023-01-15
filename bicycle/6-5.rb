class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args)
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size

    post_initialize(args)
  end

  def spares
    {chain: chain, tire_size: tire_size}.merge(local_spares)
  end

  def default_chain
    "10-speed"
  end

  def default_tire_size
    raise NotImplementedError, "Should implement #default_tire_size"
  end

  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    @style = args[:style]
    super(args)
  end

  # def spares
  #   super.merge(tape_color: tape_color)
  # end

  def default_tire_size
    "23"
  end

  def post_initialize(args)
    @tape_color = args[:tape_color]
    @style = args[:style]
  end

  def local_spares
    {tape_color: tape_color}
  end
end

class MountainBike < Bicycle
  attr_reader :front_cushion, :back_cushion

  # def initialize(args)
  #   @front_cushion = args[:front_cushion]
  #   @back_cushion = args[:back_cushion]
  #   super(args)
  # end

  # def spares
  #   super.merge(back_cushion: back_cushion)
  # end

  def default_tire_size
    @tire_size ||= "2.1"
  end

  def post_initialize(args)
    @front_cushion = args[:front_cushion]
    @back_cushion = args[:back_cushion]
  end

  def local_spares
    {back_cushion: back_cushion}
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  # def initialize(args)
  #   @flag = args[:flag]
  # end

  # def spares
  #   super.merge(flag: flag)
  # end

  def default_chain
    "9-speed"
  end

  def default_tire_size
    "28"
  end

  def post_initialize(args)
    @flag = args[:flag]
  end

  def local_spares
    {flag: flag}
  end
end

road_bike_args = {
  size: "M",
  tape_color: "red"
}

road_bike = RoadBike.new(road_bike_args)

puts road_bike.size # "M"
puts road_bike.spares # {chain: "10-speed", tire_size: "23", tape_color: "red"}

mountain_bike_args = {
  size: "S",
  front_cushion: "Manitou",
  back_cushion: "Fox"
}
mountain_bike = MountainBike.new(mountain_bike_args)

puts mountain_bike.size # "S"
puts mountain_bike.spares # {chain: "10-speed", tire_size: "2.1", back_cushion: "Fox"}

recumbent_bike_args = {
  size: "L",
  flag: "yellow"
}
recumbent_bike = RecumbentBike.new(recumbent_bike_args)

puts recumbent_bike.size # "L"
puts recumbent_bike.spares # {chain: "9-speed", tire_size: "28", flag: "yellow"}

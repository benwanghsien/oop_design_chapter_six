class Bicycle
  attr_reader :size, :tape_color, :style, :front_cushion, :back_cushion

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
    @style = args[:style]
    @front_cushion = args[:front_cushion]
    @back_cushion = args[:back_cushion]
  end

  def spares
    if style == :road
      {chain: "10-speed", tire_size: "23", tape_color: tape_color}
    else
      {chain: "10-speed", tire_size: "2.1", back_cushion: back_cushion}
    end
  end
end

mountain_bike_args = {
  size: "S",
  style: ":mountain",
  front_cushion: "Manitou",
  back_cushion: "Fox"
}

bike = Bicycle.new(mountain_bike_args)
puts bike.size # "S"
puts bike.spares # {chain: "10-speed", tire_size: "2.1, back_cushion: "Fox"}

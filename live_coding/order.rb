require "pry"

class Order
  attr_accessor :state

  def initialize
    @state = "create"
  end

  def pass_to_kitchen
    @state = "cooking" if change_from?("create")
  end

  def cook
    @state = "cooked" if change_from?("cooking")
  end

  def serve
    @state = "completed" if change_from?("cooked")
  end

  private

  def change_from?(*available_state)
    available_state.include?(state)
  end
end

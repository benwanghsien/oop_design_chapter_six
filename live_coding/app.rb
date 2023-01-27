require "pry"
require "./live_coding/order"

class App
  attr_reader :orders

  def initialize(options = {})
    @orders = options[:orders]
  end

  def run
    @orders.each { |order| order.state = "completed" }
    {status: finished?}
  end

  private

  def finished?
    orders.reject { |order| order.state == "completed" }.empty?
  end
end

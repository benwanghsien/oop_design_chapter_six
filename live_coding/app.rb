require "pry"
require "./live_coding/stuff"

class App
  attr_reader :orders

  def initialize(options = {})
    @orders = options[:orders]
  end

  def run
    {status: finished?}
  end

  private

  def finished?
    orders.find { |order| order.status == "pending" }.nil?
  end
end

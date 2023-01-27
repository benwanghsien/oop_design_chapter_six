require "./live_coding/order"

RSpec.describe Order do
  let(:order) { Order.new }

  describe "#pass_to_kitchen" do
    it "switches status to completed" do
      order.pass_to_kitchen
      expect(order.state).to eq("cooking")
    end
  end

  describe "#cook" do
    it "switches status to completed" do
      order.state = "cooking"
      order.cook
      expect(order.state).to eq("cooked")
    end
  end

  describe "#serve" do
    it "switches status to completed" do
      order.state = "cooked"
      order.serve
      expect(order.state).to eq("completed")
    end
  end
end

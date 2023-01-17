require "./live_coding/app"

RSpec.describe App do
  let(:app) { App.new(options) }

  describe "#run" do
    let(:pending_order) { double("Order", status: "pending") }
    let(:completed_order) { double("Order", status: "completed") }
    let(:options) do
      {
        orders: [pending_order, completed_order]
      }
    end

    it "finishes all orders" do
      completed_order_count = app.orders.find_all { |order| order.status == "completed" }
      expect(completed_order_count.size).to eq(2)
    end

    it "returns true" do
      result = app.run
      expect(result[:status]).to be_truthy
    end
  end
end

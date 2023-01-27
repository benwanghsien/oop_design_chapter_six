require "./live_coding/app"

RSpec.describe App do
  let(:app) { App.new(options) }

  describe "#run" do
    let(:pending_order) { Order.new }
    let(:options) do
      {
        orders: [pending_order, pending_order]
      }
    end

    it "finishes all orders" do
      app.run
      completed_order_count = app.orders.find_all { |order| order.state == "completed" }
      expect(completed_order_count.size).to eq(2)
    end

    it "returns true" do
      result = app.run
      expect(result[:status]).to be_truthy
    end
  end
end

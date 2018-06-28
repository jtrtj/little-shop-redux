RSpec.describe Invoice do
  describe "Validations" do
    it "should have attributes" do
      invoice = Invoice.new(
                            merchant_id: nil,
                            status: nil
                            )

      expect(invoice).to_not be_valid
    end
  end
end

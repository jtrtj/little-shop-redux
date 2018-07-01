RSpec.describe InvoiceItem do
  describe "Validations" do
    it "should have attributes" do
      invoice_item = InvoiceItem.new(
                            item_id: nil,
                            invoice_id: nil,
                            quantity: nil,
                            unit_price: nil
                            )

      expect(invoice_item).to_not be_valid
    end
  end
end

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

  describe 'class methods' do
    it '#find_invoice_item_with_highest_unit_price_invoice_id' do
      invoice_item_1 = InvoiceItem.create(
                                          item_id: 345,
                                          invoice_id: 23,
                                          quantity: 5,
                                          unit_price: 234567,
                                        )
      invoice_item_2 = InvoiceItem.create(
                                          item_id: 345,
                                          invoice_id: 44444,
                                          quantity: 5,
                                          unit_price: 500,
                                        )
      expect(InvoiceItem.find_invoice_item_with_highest_unit_price_invoice_id).to eq(invoice_item_1.invoice_id)
    end

    it '#find_invoice_item_with_lowest_unit_price_invoice_id' do
      invoice_item_1 = InvoiceItem.create(
                                          item_id: 345,
                                          invoice_id: 23,
                                          quantity: 5,
                                          unit_price: 234567,
                                        )
      invoice_item_2 = InvoiceItem.create(
                                          item_id: 345,
                                          invoice_id: 44444,
                                          quantity: 5,
                                          unit_price: 500,
                                        )
      expect(InvoiceItem.find_invoice_item_with_lowest_unit_price_invoice_id).to eq(invoice_item_2.invoice_id)
    end

    it '#find_invoice_item_with_highest_quantity_invoice_id' do
      invoice_item_1 = InvoiceItem.create(
                                          item_id: 345,
                                          invoice_id: 23,
                                          quantity: 5,
                                          unit_price: 234567,
                                        )
      invoice_item_2 = InvoiceItem.create(
                                          item_id: 345,
                                          invoice_id: 44444,
                                          quantity: 10,
                                          unit_price: 500,
                                        )
      expect(InvoiceItem.find_invoice_item_with_highest_quantity_invoice_id).to eq(invoice_item_2.invoice_id)
    end

    it '#list_by_unit_price_desc' do
      invoice_item_1 = InvoiceItem.create(
        item_id: 345,
        invoice_id: 23,
        quantity: 5,
        unit_price: 234567,
      )
      invoice_item_2 = InvoiceItem.create(
        item_id: 345,
        invoice_id: 44444,
        quantity: 10,
        unit_price: 500,
      )
      
      expect(InvoiceItem.list_by_unit_price_desc).to eq([invoice_item_1, invoice_item_2])
    end

    it '#list_by_quantity_desc' do
      invoice_item_1 = InvoiceItem.create(
        item_id: 345,
        invoice_id: 23,
        quantity: 5,
        unit_price: 234567,
      )
      invoice_item_2 = InvoiceItem.create(
        item_id: 345,
        invoice_id: 44444,
        quantity: 10,
        unit_price: 500,
      )
      
      expect(InvoiceItem.list_by_quantity_desc).to eq([invoice_item_2, invoice_item_1])
    end
  end
end

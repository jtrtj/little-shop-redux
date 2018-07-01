RSpec.describe Invoice do
  describe 'Validations' do
    it 'should have attributes' do
      invoice = Invoice.new(
                            merchant_id: nil,
                            status: nil
                            )

      expect(invoice).to_not be_valid
    end
  end

  describe 'instance methods' do
    it '#total_price' do
      invoice = Invoice.create(merchant_id: 99999, status: 'shipped')
      item = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_1 = InvoiceItem.create(
                                          item_id: item.id,
                                          invoice_id: invoice.id,
                                          quantity: 5,
                                          unit_price: item.price,
                                         )

      invoice_item_2 = InvoiceItem.create(
                                          item_id: item.id,
                                          invoice_id: invoice.id,
                                          quantity: 1,
                                          unit_price: item.price,
                                         )

      expect(invoice.total_price).to eq(3000)
    end
  end

  describe 'class methods' do
    it '#amount_by_status(status)' do
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'returned')

      expect(Invoice.amount_by_status('shipped')).to eq(2)
      expect(Invoice.amount_by_status('pending')).to eq(3)
      expect(Invoice.amount_by_status('returned')).to eq(1)
    end

    it '#percentage_by_status(status)' do
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'returned')

      expect(Invoice.percentage_by_status('shipped')).to eq(66.67)
      expect(Invoice.percentage_by_status('pending')).to eq(100.00)
      expect(Invoice.percentage_by_status('returned')).to eq(16.67)
    end
  end
end

=begin
Each Invoice status as a percent of total invoices
Invoice with the highest associated unit_price
Invoice with the lowest associated unit_price
Invoice with the highest associated quantity
Invoice with the lowest associated quantity
=end
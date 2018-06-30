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
end

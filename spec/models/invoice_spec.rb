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

      expect(Invoice.percentage_by_status('shipped')).to eq(33.0)
      expect(Invoice.percentage_by_status('pending')).to eq(50.0)
      expect(Invoice.percentage_by_status('returned')).to eq(17.0)
    end

    it '#invoice_with_highest_unit_price' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 5,
                                          unit_price: item_2.price,
                                         )

      expect(Invoice.invoice_with_highest_unit_price).to eq(invoice_2)
    end

    it '#invoice_with_lowest_unit_price' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 5,
                                          unit_price: item_2.price,
                                         )

      expect(Invoice.invoice_with_lowest_unit_price).to eq(invoice_1)
    end

    it '#invoice_with_highest_quantity' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 10,
                                          unit_price: item_2.price,
                                         )

      expect(Invoice.invoice_with_highest_quantity).to eq(invoice_2)
    end

    it '#invoice_with_lowest_quantity' do
      invoice_1 = Invoice.create(merchant_id: 99999, status: 'shipped')
      invoice_2 = Invoice.create(merchant_id: 77777, status: 'shipped')
      item_1 = Item.create(
                          title: 'VapeTron',
                          description: 'World\'s #1 Vape Pen',
                          price: 500,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_1 = InvoiceItem.create(
                                          item_id: item_1.id,
                                          invoice_id: invoice_1.id,
                                          quantity: 5,
                                          unit_price: item_1.price,
                                         )
      item_2 = Item.create(
                          title: 'VapeWnd',
                          description: 'World\'s #1 Vape Pen',
                          price: 1000,
                          image: '/data/image_file_name',
                          merchant_id: 6789
                         )
                         
      invoice_item_2 = InvoiceItem.create(
                                          item_id: item_2.id,
                                          invoice_id: invoice_2.id,
                                          quantity: 10,
                                          unit_price: item_2.price,
                                         )

      expect(Invoice.invoice_with_lowest_quantity).to eq(invoice_1)
    end
  end
end
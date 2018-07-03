RSpec.describe 'User' do
  context 'visiting /invoices/dashboard' do
    it 'should see a header' do
      visit '/invoices/dashboard'
      expect(page).to have_content('Invoices Dashboard')
    end

    it 'should see percentage of each invoice status' do
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'shipped')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'pending')
      Invoice.create(merchant_id: 99999, status: 'returned')

      visit '/invoices/dashboard'

      expect(page).to have_content("Shipped: #{Invoice.percentage_by_status('shipped')}")
      expect(page).to have_content("Pending: #{Invoice.percentage_by_status('pending')}")
      expect(page).to have_content("Returned: #{Invoice.percentage_by_status('returned')}")
    end
  end
end

RSpec.describe 'User' do
  context 'visiting /invoices/dashboard' do
    it 'should see a header' do
      visit '/invoices/dashboard'
      expect(page).to have_content('Invoices Dashboard')
    end
  end
end

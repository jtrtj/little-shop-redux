RSpec.describe 'user can delete invoice' do
  it 'by clicking delete button on show page' do
    invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

    visit "/invoices/#{invoice_1.id}"

      click_button "Delete"

    expect(current_path).to eq('/invoices')
    expect(page).to_not have_content(invoice_1.id)
  end
end

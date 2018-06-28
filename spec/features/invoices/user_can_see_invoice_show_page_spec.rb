describe 'User visits show page' do
  it 'should go to edit page when invoice edit button is clicked' do
    invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

    visit '/invoices'

    within("#invoice_1") do
      click_button "Edit"

      expect(current_path).to eq("/invoices/#{invoice_1.id}/edit")
      end
    end
  end


describe 'User visits show page' do
  it 'can delete by clicking delete button on show page' do
    invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

    visit "/invoices/#{invoice_1.id}"

      click_button "Delete"

    expect(current_path).to eq('/invoices')
    expect(page).to_not have_content(invoice_1.id)
  end
end

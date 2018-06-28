describe "User visits index page" do
  it "should show a list of all invoices" do
    invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

    visit "/invoices"

    expect(page).to have_content(invoice_1.id)
    expect(page).to have_content(invoice_2.id)
  end
end

describe 'User edits invoice' do
  it 'should go to edit page when invoice edit button is clicked' do
    invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

    visit '/invoices'

    within("#invoice_1") do
      click_button "Edit"

      expect(current_path).to eq("/invoices/#{invoice_1.id}/edit")
    end
  end

  it 'user can delete an invoice' do
    invoice_1 = Invoice.create(merchant_id: 12, status: 'pending')
    invoice_2 = Invoice.create(merchant_id: 23, status: 'shipped')

    visit "/invoices"

    within("#invoice_1") do
      click_button "Delete"

      expect(current_path).to eq("/invoices")
    end

    expect(current_path).to eq('/invoices')
    expect(page).to_not have_content(invoice_1.id)
  end
end

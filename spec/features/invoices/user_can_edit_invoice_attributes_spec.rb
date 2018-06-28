describe 'User sees an edit invoice page' do
  it 'shows an edit invoice form' do
    invoice = Invoice.create(merchant_id: 1234567, status:'pending')
    new_merchant_id = 5444444

    visit "/invoices/#{invoice.id}/edit"
    fill_in 'invoice[merchant_id]', with: "#{new_merchant_id}"
    click_on 'Edit Invoice'

    expect(current_path).to eq("/invoices/#{invoice.id}")
    expect(page).to have_content(new_merchant_id)
    expect(page).to_not have_content(invoice.merchant_id)
  end
end

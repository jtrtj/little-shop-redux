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

describe 'User visits show page' do
  it 'can see all items on a single invoice' do
    invoice = Invoice.create(merchant_id: 12, status: 'pending')

    invoice_item_1 = invoice.invoice_items.create(item_id: 1, quantity: 789, price: 1)
    invoice_item_2 = invoice.invoice_items.create(item_id: 2, quantity: 987, price: 11)
    invoice_item_3 = invoice.invoice_items.create(item_id: 3, quantity: 321, price: 111)

    item = Item.create(title: 'vapebot', description: 'descriptionssssssss', price: 50, image: 'file_path', merchant_id: 2)
require 'pry'; binding.pry
    visit "/invoices/#{invoice.id}"
    save_and_open_page

    expect(page).to have_content("Item ID: #{invoice_item_1.item_id}")
    expect(page).to have_content("Quantity: #{invoice_item_1.quantity}")
    expect(page).to have_content("Price: #{invoice_item_1.price}")
    expect(page).to have_content("Item Title: #{invoice_item_1.items.title}")

    expect(page).to have_content("Item ID: #{invoice_item_2.item_id}")
    expect(page).to have_content("Quantity: #{invoice_item_2.quantity}")
    expect(page).to have_content("Price: #{invoice_item_2.price}")
    expect(page).to have_content("Item Title: #{invoice_item_2.items.title}")

    expect(page).to have_content("Item ID: #{invoice_item_3.item_id}")
    expect(page).to have_content("Quantity: #{invoice_item_3.quantity}")
    expect(page).to have_content("Price: #{invoice_item_3.price}")
    expect(page).to have_content("Item Title: #{invoice_item_3.items.title}")
    end
  end
end

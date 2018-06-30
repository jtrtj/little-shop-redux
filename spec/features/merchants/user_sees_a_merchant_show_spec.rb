RSpec.describe 'user' do
  context 'visiting /merchants/id' do
    it 'should see a single merchant with all of its items' do
      merchant = Merchant.create(name: "KONG")

      visit "/merchants/#{merchant.id}"
  
      expect(page).to have_content(merchant.name)
    end

    it 'can click edit button to edit merchant' do
      merchant = Merchant.create(name: "KONG")

      visit "/merchants/#{merchant.id}"
      click_button "Edit"

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
    
    it 'can click delete button to delete merchant' do
      merchant = Merchant.create(name: "KONG")

      visit "/merchants/#{merchant.id}"
      click_button 'Delete'

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content(merchant.name)
    end

  end
end

describe "User visits index page" do
    it "should show a list of all merchants" do
      merchant_1 = Merchant.create(name: "7-eleven")
      merchant_2 = Merchant.create(name: "Rite Aid")

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end

    it 'should go to edit page when merchant edit button is clicked' do
      merchant = Merchant.create(name: "7-eleven")

      visit '/merchants'
      click_on 'Edit'

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
end

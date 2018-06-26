describe "User visits index page" do
    it "should show a list of all merchants" do
      merchant_1 = Merchant.create(name: "7-eleven")
      merchant_2 = Merchant.create(name: "Rite Aid")

      visit "/merchants"

      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content(merchant_2.name)
    end
end

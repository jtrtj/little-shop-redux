RSpec.describe "User" do
  context "visits merchants/dashboard" do
    it "should see Header" do
      visit 'merchants/dashboard'

      expect(page).to have_content("Merchants Dashboard")
    end
    it "should see Merchant With Most Items" do
      merchant_1 = Merchant.create(name: "Dogs4Life")
      merchant_2 = Merchant.create(name: "Cats, wow")

      item_1 = Item.create(
                          title: 'dog bed',
                          description: 'a bed for dogs',
                          price: 700,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      item_2 = Item.create(
                          title: 'cat bed',
                          description: 'a bed for cats',
                          price: 500,
                          image: 'image url',
                          merchant_id: merchant_2.id
                          )
      item_3= Item.create(
                          title: 'dog bone',
                          description: 'a bone for dogs',
                          price: 20,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )

      visit 'merchants/dashboard'

      
      expect(page).to have_content("Merchant With Most Items: #{merchant.most_items.name}")
    end
  end
end

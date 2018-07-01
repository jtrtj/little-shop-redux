RSpec.describe Merchant do
  describe "Validations" do
    it "should have a name" do
      merchant = Merchant.new(name: nil)

      expect(merchant).to_not be_valid
    end
  end

  describe "Instance Methods" do
    it ".total_merchant_items" do
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
    expect(merchant_1.total_merchant_items).to eq(2)
    expect(merchant_2.total_merchant_items).to eq(1)
    end

    it ".average_item_price" do
      merchant_1 = Merchant.create(name: "Dogs4Life")

      item_1 = Item.create(
                          title: 'dog bed',
                          description: 'a bed for dogs',
                          price: 3,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      item_3= Item.create(
                          title: 'dog bone',
                          description: 'a bone for dogs',
                          price: 1,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      expect(merchant_1.average_item_price).to eq(2)
    end

    it ".total_price_all_items" do
      merchant_1 = Merchant.create(name: "Dogs4Life")

      item_1 = Item.create(
                          title: 'dog bed',
                          description: 'a bed for dogs',
                          price: 700,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      item_3= Item.create(
                          title: 'dog bone',
                          description: 'a bone for dogs',
                          price: 20,
                          image: 'image url',
                          merchant_id: merchant_1.id
                          )
      expect(merchant_1.total_price_all_items).to eq(720)
    end
  end

  describe "Class Methods" do
    it ".most_items" do
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
      expect(Merchant.most_items).to eq(merchant_1)
    end

    it ".highest_priced_item" do
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
      expect(Merchant.highest_priced_item).to eq(merchant_1)
    end
  end
end

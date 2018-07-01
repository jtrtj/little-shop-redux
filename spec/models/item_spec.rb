RSpec.describe Item do
  describe "Validations" do
    it "should have attributes" do
      item = Item.create(
                      title: nil,
                      description: nil,
                      price: nil,
                      image: nil
                    )

      expect(item).to_not be_valid
    end
  end

  describe "Class Methods" do
    it '.total_item_count' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )
      expect(Item.total_item_count).to eq(2)
    end

    it '.average_unit_price' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )
      expect(Item.average_unit_price).to eq(600)
    end

    it '.newest' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )
      expect(Item.newest).to eq(item_2.title)
    end

    it '.oldest' do
      item_1 = Item.create(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url',
                        merchant_id: 3456
                      )
      item_2 = Item.create(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url',
                        merchant_id: 3456
                      )
      expect(Item.oldest).to eq(item_1.title)
    end
  end
end

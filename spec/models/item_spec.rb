RSpec.describe Item do
  describe "Validations" do
    it "should have attributes" do
      item = Item.new(
                      title: nil,
                      description: nil,
                      price: nil,
                      image: nil
                    )

      expect(item).to_not be_valid
    end
  end

  describe "Class Methods" do
    it ".average_unit_price" do
      item_1 = Item.new(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url'
                      )
      item_2 = Item.new(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url'
                      )
      expect(@items.average_unit_price).to eq(600)
    end

    it ".newest" do
      item_1 = Item.new(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url'
                      )
      item_2 = Item.new(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url'
                      )
      expect(@items.newest).to eq(item_2.title)
    end

    it ".oldest" do
      item_1 = Item.new(
                        title: 'dog bed',
                        description: 'a bed for dogs',
                        price: 700,
                        image: 'image url'
                      )
      item_2 = Item.new(
                        title: 'cat bed',
                        description: 'a bed for cats',
                        price: 500,
                        image: 'image url'
                      )
      expect(@items.oldest).to eq(item_1.title)
    end
  end
end

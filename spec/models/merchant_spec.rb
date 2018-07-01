RSpec.describe Merchant do
  describe "Validations" do
    it "should have a name" do
      merchant = Merchant.new(name: nil)

      expect(merchant).to_not be_valid
    end
  end

  describe "Instance Methods" do
    it ".total_merchant_items" do

    end

    it ".average_item_price" do

    end

    it ".total_price_all_items" do

    end
  end

  describe "Class Methods" do
    it ".most_items" do

    end

    it ".highest_priced_item" do

    end

    it ".total_price_all_items" do

    end
  end
end

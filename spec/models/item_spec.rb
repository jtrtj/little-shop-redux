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

end

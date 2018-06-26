RSpec.describe Merchant do
  describe "Validations" do
    it "should have a name" do
      merchant = Merchant.new(name: nil)

      expect(merchant).to_not be_valid
    end
    
  end
  
end

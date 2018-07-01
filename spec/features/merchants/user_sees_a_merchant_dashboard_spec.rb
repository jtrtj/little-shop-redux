RSpec.describe "User" do
  context "visits merchants/dashboard" do
    it "should see Header" do
      visit 'merchants/dashboard'

      expect(page).to have_content("Merchants Dashboard")
    end
  end
end

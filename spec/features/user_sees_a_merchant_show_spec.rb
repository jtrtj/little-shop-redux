describe "User visits a merchant show page" do
  it "shows a single merchant" do
    merchant = Merchant.create(name: "KONG")

    visit "/merchants/#{merchant.id}"

    expect(page).to have_content(merchant.name)
  end
  
end

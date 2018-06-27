describe 'User sees an edit merchant page' do
  it 'shows an edit merchant form' do
    merchant = Merchant.create(name: '7-11')
    new_name = 'Smoke 420 Vape'

    visit "/merchants/#{merchant.id}/edit"
    fill_in 'merchant[name]', with: "#{new_name}"
    click_on 'Edit Merchant'

    expect(current_path).to eq('/merchants')
    expect(page).to have_content(merchant.name)
    expect(page).to_not have_content('7-11')
  end
  
end

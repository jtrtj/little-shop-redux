describe 'User visits index page' do
  it 'should show a list of all items' do
    item_1 = Item.create(
                        title: 'VapeTron',
                        description: 'World\'s #1 Vape Pen',
                        price: 500,
                        image: '/data/image_file_name'
                      )
    item_2 = Item.create(
                        title: 'VapeJuice',
                        description: 'Grape flavor',
                        price: 100,
                        image:'/data/image_file_name_'
                      )

    visit '/items'

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.description)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.image)

    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.description)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content(item_2.image)
  end
end

# describe 'User edits merchant' do
#   it 'should go to edit page when merchant edit button is clicked' do
#     merchant = Merchant.create(name: '7-eleven')
#
#     visit '/merchants'
  #   click_button 'Edit'
  #
  #   expect(current_path).to eq('/merchants/#{merchant.id}/edit')
  # end
  #
  # it 'user can delete a merchant' do
  #   merchant = Merchant.create(name: 'Darth Vapor')
  #
  #   visit '/merchants'
  #   click_button 'Delete'
  #
  #   expect(current_path).to eq('/merchants')
  #   expect(page).to_not have_content(merchant.name)
  # end

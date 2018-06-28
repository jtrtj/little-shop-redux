describe 'User edits item' do
  it 'should go to edit page when item edit button is clicked' do
    item = Item.create(
                        title: 'VapeTron',
                        description: 'World\'s #1 Vape Pen',
                        price: 500,
                        image: '/data/image_file_name'
                      )

    visit '/items'
    click_button "Edit"

    expect(current_path).to eq("/items/#{item.id}/edit")
  end

  it 'user can delete a item' do
    item = Item.create(
                        title: 'VapeTron',
                        description: 'World\'s #1 Vape Pen',
                        price: 500,
                        image: '/data/image_file_name'
                      )

    visit "/items"
    click_button 'Delete'

    expect(current_path).to eq('/items')
    expect(page).to_not have_content(item.title)
  end
end

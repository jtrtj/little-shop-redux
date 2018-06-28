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
    expect(page).to have_content(item_1.price)

    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.price)
  end
end

describe 'User edits item' do
  it 'should go to edit page when item edit button is clicked' do
  item = Item.create(
                      title: 'VapeTron',
                      description: 'World\'s #1 Vape Pen',
                      price: 500,
                      image: '/data/image_file_name'
                    )

    visit '/items'
    click_button 'Edit'

    expect(current_path).to eq('/items/#{item.id}/edit')
  end

  it 'user can delete a item' do
    item = Item.create(
                        title: 'VapeTron',
                        description: 'World\'s #1 Vape Pen',
                        price: 500,
                        image: '/data/image_file_name'
                      )

    visit '/items'
    click_button 'Delete'

    expect(current_path).to eq('/items')
    expect(page).to_not have_content(item.title)
  end
end

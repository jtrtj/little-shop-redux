RSpec.describe 'User' do
  context 'visiting /items/dashboard' do
    it 'should see item dashboard header' do

      visit '/items/dashboard'

      expect(page).to have_content('Item Dashboard')
    end

    it 'should see item total count' do

      visit '/items/dashboard'

      expect(page).to have_content("Item Total Count: #{Item.total_count}")
    end

    it 'should see average price per item' do

      visit '/items/dashboard'

      expect(page).to have_content("Average Price Per Item: #{Item.average_price}")
    end

    it 'should see item by age' do

      visit '/items/dashboard'

      expect(page).to have_content("Item By Age:")
      expect(page).to have_content("Newest: #{Item.newest}")
      expect(page).to have_content("Oldest: #{Item.oldest}")
    end
  end
end

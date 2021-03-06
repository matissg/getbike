feature 'User new bike' do
  before :each do
    Bike.create!(number: 'bike_1')
  end
  scenario 'they see confirmation on screen' do
    visit new_bike_path
    fill_in 'bike[number]', with: 'bike_2'
    click_button 'Create'
    expect(page).to have_content "Bike bike_2 was successfully created."
  end
end

feature 'User sees bikes table' do
  scenario 'they see table with one bike' do
    visit bikes_path
    within('table') do
      expect(all('tr').count).to eq(1)
    end
  end
end

feature 'User edit bike number' do
  scenario 'they see confirmation on screen' do
    bike = Bike.create!(number: 'bike_8')
    visit edit_bike_path(bike)

    fill_in 'bike[number]', with: 'bike_88'
    click_button 'Update'

    expect(page).to have_content "Bike bike_88 was successfully updated."
  end
end

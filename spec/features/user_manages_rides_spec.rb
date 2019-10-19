feature 'User new ride' do

  before do
    Employee.create([{name: 'Matiss'},{name: 'John'}])
    Bike.create(number: 'bike_1')
  end

  scenario 'they see confirmation on screen' do
    visit new_ride_path(source: 'rides')

    select 'Matiss', from: 'Employee'
    fill_in "ride_starts_ends", with:
    "#{1.day.from_now.strftime("%d.%m.%Y %H:%M")} - #{2.days.from_now.strftime("%d.%m.%Y %H:%M")}"
    click_button 'Confirm'

    expect(page).to have_content 'Ride was successfully created.'
  end

end

feature 'User sees rides table' do
  scenario 'they see table with one ride' do
    visit rides_path
    within('table') do
      expect(all('tr').count).to eq(1)
    end
  end
end

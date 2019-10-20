feature 'User new ride' do
  before do
    Employee.create!([{name: 'Matiss'},{name: 'John'}])
    Bike.create!(number: 'bike_1')
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

feature 'User edit employee ride' do
  scenario 'they see confirmation on screen' do
    employee = Employee.create!(name: 'Grant')
    bike = Bike.create!(number: 'bike_11')
    ride = Ride.create!(
      employee_id: employee.id, bike_id: bike.id,
      starts_ends: "#{1.day.from_now.strftime("%d.%m.%Y %H:%M")} - #{2.days.from_now.strftime("%d.%m.%Y %H:%M")}"
    )
    visit edit_ride_path(ride.id, employee_id: ride.employee_id)

    fill_in "ride_starts_ends", with:
    "#{4.days.from_now.strftime("%d.%m.%Y %H:%M")} - #{5.days.from_now.strftime("%d.%m.%Y %H:%M")}"
    click_button 'Update'

    expect(page).to have_content "Ride was successfully updated."
  end
end

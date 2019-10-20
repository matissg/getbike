feature 'User new employee' do
  scenario 'they see confirmation on screen' do
    visit new_employee_path

    fill_in 'employee[name]', with: 'Grant'
    click_button 'Create'

    expect(page).to have_content "Grant was added!"
  end
end

feature 'User sees employees table' do
  scenario 'they see table with employees' do
    visit employees_path
    within('table') do
      expect(all('tr').count).to eq(1)
    end
  end
end

feature 'User edit employee name' do
  scenario 'they see confirmation on screen' do
    employee = Employee.create!(name: 'Eve')
    visit edit_employee_path(employee)

    fill_in 'employee[name]', with: 'Eve Johnson'
    click_button 'Update'

    expect(page).to have_content "Eve Johnson was updated!"
  end
end

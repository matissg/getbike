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

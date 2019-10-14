feature 'User new employee' do
  scenario 'they see confirmation on screen' do
    visit new_employee_path

    fill_in 'employee[name]', with: 'Grant'
    click_button 'Create'

    expect(page).to have_css 'div.alert'
  end
end

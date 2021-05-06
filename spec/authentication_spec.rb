require 'rails_helper'

RSpec.describe 'Siggin Up', type: :feature do
  scenario 'Sign up with valid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Emmy'
    fill_in 'Username', with: 'microverse'
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to have_content('microverse')
  end

  scenario 'Sign up with invalid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: ''
    fill_in 'Username', with: 'microverse'
    fill_in 'Email', with: 'testgmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '1234567'
    click_on 'Sign up'
    sleep(3)
    visit root_path
    expect(page).to_not have_content('microverse')
  end
end

RSpec.describe 'Loggin In', type: :feature do
  let(:user) { User.create(name: 'Emmy', username: 'microverse', email: 'test@gmail.com', password: '123456') }
  scenario 'Log in with valid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to have_content('microverse')
  end

  scenario 'Log in with invalid inputs' do
    visit new_user_session_path
    fill_in 'Email', with: 'Banana'
    fill_in 'Password', with: user.password
    click_on 'Log in'
    sleep(3)
    expect(page).to_not have_content('microverse')
  end
end

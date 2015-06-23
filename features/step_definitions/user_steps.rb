Given(/^I am not registered$/) do
  expect(User.count).to eq(0)
end

When(/^I register$/) do
  visit new_user_registration_path

  fill_in 'Email', with: 'ben@jam.in'
  fill_in 'Password', with: 'ben@jam.in'
  fill_in 'Password confirmation', with: 'ben@jam.in'

  click_button 'Sign up'
end

Then(/^my account is created$/) do
  expect(User.count).to eq(1)
end

Then(/^I am directed to my profile$/) do
  expect(page).to have_content('ben@jam.in')
end

Given(/^I am not registered$/) do
  expect(User.count).to eq(0)
end

When(/^I register$/) do
  visit new_user_registration_path

  fill_in 'Email', with: 'ben@ben.ben'
  fill_in 'Password', with: 'ben@ben.ben'
  fill_in 'Password confirmation', with: 'ben@ben.ben'

  click_button 'Sign up'
end

Then(/^my account is created$/) do
  expect(User.count).to eq(1)
end

Then(/^I am directed to my profile$/) do
  expect(page).to have_content('ben@ben.ben')
end

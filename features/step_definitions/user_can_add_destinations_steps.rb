Given(/^I am registered$/) do
  visit new_user_registration_path

  fill_in 'Email', with: 'ben@ben.ben'
  fill_in 'Password', with: 'ben@ben.ben'
  fill_in 'Password confirmation', with: 'ben@ben.ben'

  click_button 'Sign up'
end

When(/^I add a uniquely named Destination$/) do
  find_button('Add a Destination').click

  fill_in 'Name', with: 'Ireland'

  click_button 'Create Destination'
end

Then(/^the Destination appears on my Bucket List$/) do
  expect(page).to have_content('Ireland')
end

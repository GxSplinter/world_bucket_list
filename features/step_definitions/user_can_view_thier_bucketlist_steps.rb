Given(/^I have created Destinations$/) do
  click_button 'Add a Destination'
  fill_in 'Name', with: 'Italy'
  click_button 'Create Destination'

  click_button 'Add a Destination'
  fill_in 'Name', with: 'Brazil'
  click_button 'Create Destination'
end

When(/^I view my Bucket List$/) do
  visit user_path
end

Then(/^I see my Destinations in alphabetical order$/) do
  expect(page.all('legend').map(&:text)).to eq(['Brazil', 'Italy'])
end

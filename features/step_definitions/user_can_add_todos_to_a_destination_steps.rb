When(/^I add a ToDo to a Destination$/) do
  within "fieldset##{Destination.last.id}" do
    click_button 'Add ToDo'
  end

  fill_in 'Details', with: 'Your nan'

  click_button 'Save'
end

Then(/^the ToDo appears under its Destination on the Bucket List$/) do
  within "fieldset##{Destination.last.id}" do
    expect(page).to have_content('Your nan')
  end
end

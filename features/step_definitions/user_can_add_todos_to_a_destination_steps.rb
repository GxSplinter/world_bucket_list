When(/^I add a ToDo to a Destination$/) do
  within "fieldset##{Destination.last.id}" do
    click_button 'Add ToDo'
  end

  fill_in 'Details', with: 'Your nan'
  fill_in 'Location', with: 'London'

  click_button 'Save'
end

Then(/^the ToDo appears under its Destination on the Bucket List$/) do
  within "fieldset##{Destination.last.id}" do
    expect(page).to have_content('Your nan')
  end
end

Then(/^The ToDo has longitude and latitude$/) do
  @todo = Todo.last
  expect(@todo.latitude).to_not be_nil
  expect(@todo.longitude).to_not be_nil
end

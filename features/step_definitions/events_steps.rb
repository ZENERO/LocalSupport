Given (/^I fill in the new event page validly$/) do
  fill_in 'event_title', with: 'Hackathon'
  fill_in 'event_description', with: 'Great place to brain storm'
  fill_in 'event_start_date', with: '2017-05-02'
  fill_in 'event_end_date', with: '2017-05-05'
end

Given /^I create "(.*?)" event$/ do |name|
  page.driver.submit :post, '/events', event: {name: name}
end

Then /^"(.*?)" event should not exist$/ do |title|
  expect(Event.find_by_title title).to be_nil
end

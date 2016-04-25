When(/^I go to the default home page$/) do
  visit '/' 
end

Then(/^I see 'welcome'$/) do
  page.find('#resources').text('welcome')
end

Then(/^I see a link to 'Articles'/) do
  page.find('a').text('Articles')
end

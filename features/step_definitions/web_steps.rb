When(/^I go to the default home page$/) do
  visit '/' 
end

Then(/^I see 'welcome'$/) do
  page.find('h1').text('welcome')
end

Then(/^I see a link to 'Articles'/) do
  page.find('#link_articles').text('Articles')
end

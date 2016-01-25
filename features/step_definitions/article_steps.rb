Given(/^an existing article$/) do
  @article1 = create(:article)
end

Given(/^two articles$/) do
  @article1 = create(:article)
  @article2 = create(:article)
end

Given(/^the user goes on the new article page$/) do
  visit new_article_path
end

When(/^the user goes to the articles list$/) do
  visit articles_path
end

When(/^the user fills the article's informations$/) do
  fill_in 'article_reference', with: 'test reference'
  select @brand1.name, from: 'article_brand_id'
end

When(/^the user creates a new article$/) do
  click_button 'Create Article'
end

When(/^the user open this article$/) do
  click_link 'Show'
end

When(/^the user edit this article$/) do
  visit edit_article_path(@article1)
end

When(/^the user commit the change$/) do
  find(:xpath, '//*[@type="submit"]').click
end

Then(/^the user see the two articles$/) do
  expect(page).to have_content(@article1.reference)
  expect(page).to have_content(@article2.reference)
end

Then(/^this article belongs to the articles$/) do
  expect(Article.where(reference: 'test reference').count).to eq(1)
end

Then(/^the user see this article$/) do
  expect(page).to have_content('Article')
  expect(page).to have_content(@article1.reference)
end

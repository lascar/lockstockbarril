Given(/^a list of articles$/) do
  @articles = create_list(:article, 2)
end

When(/^I click 'Articles'$/) do
  click_link('Articles')
end

Then(/^I see the list of articles$/) do
   within("#Articles") do
    @articles.each do |article|
      expect(page).to have_content(article.reference)
    end
  end
end


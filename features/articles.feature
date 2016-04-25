@javascript
Feature: Articles 
  In order to read the api 'articles'
  As an user
  I can navigate in 'articles'

  Scenario: Welcome page
  Given a list of articles
  When I go to the default home page
  And I click 'Articles'
  Then I see the list of articles

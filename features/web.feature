@javascript
Feature: Web
  In order to read the api
  As an user
  I dispose to the link menu

Scenario: Welcome page
  When I go to the default home page
  Then I see 'welcome'
  And I see a link to 'Articles'

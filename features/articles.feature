@javascript
Feature: Article Management
  As a user
  I want to manage articles
  In order to aggregate datas


  Scenario: List articles
    Given an authenticate user
    Given two articles 
    When the user goes to the articles list
    Then the user see the two articles
    
  Scenario: New article
    Given an authenticate user
    And an existing brand
    And the user goes on the new article page
    When the user fills the article's informations
    And the user creates a new article
    Then this article belongs to the articles

  Scenario: Show an article
    Given an authenticate user
    And an existing article
    And an existing brand
    When the user goes to the articles list
    And the user open this article
    Then the user see this article

  Scenario: Update an article
    Given an authenticate user
    And an existing article
    And an existing brand
    When the user edit this article
    And the user fills the article's informations
    And the user commit the change
    Then this article belongs to the articles

Feature: Buy Credit packs on Quora

  Scenario Outline: Valid Cards
    Given I am on quora site
    And I login with <email> and <pass>
    When I go to the store page to buy credit packs
    And I fill the <account>, <date> and <cvv> details
    Then The transaction should be successful
    Examples:
      | email              | pass       | account            | date  | cvv |
      | rock_p1e@domain.com| rockp1e,./ | 4242424242424242   | 0421  | 224 |
      | rock_p1e@domain.com| rockp1e,./ | 5555555555554444   | 0623  | 789 |
      | rock_p1e@domain.com| rockp1e,./ | 5200828282828210   | 0323  | 234 |
      | rock_p1e@domain.com| rockp1e,./ | 4111111111111111   | 0224  | 329 |

  Scenario Outline: Incomplete Cards
    Given I am on quora site
    And I login with <email> and <pass>
    When I go to the store page to buy credit packs
    And I fill the <account>, <date> and <cvv> details
    Then The transaction should not be successful

    Examples:
       | email                 | pass     | account        | date  | cvv |
       | Trickster@localserver | Trick1,  |                |       |     |
       | Trickster@localserver | Trick1,  | 410000000000001| 0223  | 323 |

Scenario Outline: Declined Cards
      Given I am on quora site
      And I login with <email> and <pass>
      When I go to the store page to buy credit packs
      And I fill the <account>, <date> and <cvv> details
      Then The transaction should be declined
      Examples:
        | email                 | pass     | account            | date  | cvv |
        | Ricky_Sale@domain.com | Ricky1,  |  4100000000000019  | 0424  | 899 |
        | Ricky_Sale@domain.com | Ricky1,  |  4000000000009987  | 0525  | 722 |
        | Ricky_Sale@domain.com | Ricky1,  |  4000008400001280  | 0822  | 977 |
        | Ricky_Sale@domain.com | Ricky1,  |  4000000000009979  | 0723  | 234 |

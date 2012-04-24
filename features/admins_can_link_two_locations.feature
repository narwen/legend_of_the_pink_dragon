Feature: Admin users can link to locations

  Background:
    Given I am a authenticated admin
    And the following locations:
      | Name      |
      | Jamestown |
      | New York  |
      | Joplin    |

  Scenario: Admin can link a location to the north
    When I go to the "Jamestown" admin location show page
    Then I should not see "Jamestown" within unlinked locations
    And I click "North" within the "Joplin" unlinked location
    Then I should see "To the north: Joplin"
    And I should not see "Joplin" within unlinked locations
    When I go to the "Joplin" admin location show page
    Then I should see "To the south: Jamestown"
    And I should not see "Jamestown" within unlinked locations

  Scenario: Admin can link a location to the south
    When I go to the "Jamestown" admin location show page
    Then I should not see "Jamestown" within unlinked locations
    And I click "South" within the "Joplin" unlinked location
    Then I should see "To the south: Joplin"
    And I should not see "Joplin" within unlinked locations
    When I go to the "Joplin" admin location show page
    Then I should see "To the north: Jamestown"
    And I should not see "Jamestown" within unlinked locations

  Scenario: Admin can link a location to the west
    When I go to the "Jamestown" admin location show page
    Then I should not see "Jamestown" within unlinked locations
    And I click "West" within the "Joplin" unlinked location
    Then I should see "To the west: Joplin"
    And I should not see "Joplin" within unlinked locations
    When I go to the "Joplin" admin location show page
    Then I should see "To the east: Jamestown"
    And I should not see "Jamestown" within unlinked locations

  Scenario: Admin can link a location to the east
    When I go to the "Jamestown" admin location show page
    Then I should not see "Jamestown" within unlinked locations
    And I click "East" within the "Joplin" unlinked location
    Then I should see "To the east: Joplin"
    And I should not see "Joplin" within unlinked locations
    When I go to the "Joplin" admin location show page
    Then I should see "To the west: Jamestown"
    And I should not see "Jamestown" within unlinked locations

  Scenario: Overriding a link should fix existing links
    When I go to the "Jamestown" admin location show page
    And I click "East" within the "Joplin" unlinked location
    And I go to the "New York" admin location show page
    And I click "East" within the "Joplin" unlinked location
    And I go to the "Joplin" admin location show page
    Then I should see "To the west: New York"
    When I go to the "Jamestown" admin location show page
    Then I should not see "To the east: Joplin"

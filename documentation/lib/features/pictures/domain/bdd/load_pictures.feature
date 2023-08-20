Feature: Load Pictures

As a user, I want to view all captures to understand their details and continue using the service.

Scenario: With Internet Connection
- Given that the user is connected to the internet
- When the user requests to view the captures
- Then the system should display the captures
- And update the data in the cache

Scenario: Without Internet Connection
- Given that the user is not connected to the internet
- When the user requests to view the captures
- Then the system should display the captures that were last accessed and stored in the cache.
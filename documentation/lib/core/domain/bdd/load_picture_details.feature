Feature: Load Picture Details

As a user, I want to view the details of a capture to know its status.

Scenario: With Internet Connection
- Given that the user is connected to the internet
- When the user requests to view the details of a capture
- Then the system should display the capture details
- And update the data in the cache

Scenario: Without Internet Connection
- Given that the user is not connected to the internet
- When the user requests to view the details of a capture
- Then the system should display the capture details that were last accessed and stored in the cache.

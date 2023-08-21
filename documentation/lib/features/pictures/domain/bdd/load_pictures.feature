Pictures

User Request: Display a descending list of all captures, paginate every 10 items, and ensure offline usability with cached data from the last session.

Scenario: With Internet Connection
- Given that the user is connected to the internet
- When the user requests to view the captures
- Then the system should display the captures in a descending list
- The system should paginate the list, displaying 10 items per page
- The system should update the cache with the retrieved data

Scenario: Without Internet Connection
- Given that the user is not connected to the internet
- When the user requests to view the captures
- Then the system should display the captures that were last accessed and stored in the cache
- The system should display the captures in a descending list
- The system should paginate the list, displaying 10 items per page
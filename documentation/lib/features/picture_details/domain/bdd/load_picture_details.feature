Picture Details

User Request: Display capture details and enable offline usability with cached data from previous sessions.

Scenario: With Internet Connection
- Given that the user is connected to the internet
- When the user requests to view the details of a capture
- Then the system should attempt to retrieve the capture details that were last accessed and stored in the cache
- If the details exist in the cache, the system should display the capture details
- If the details do not exist in the cache, the system should attempt to make a `GET` request to the API
- The system should then update the cache with the retrieved data

Scenario: Without Internet Connection
- Given that the user is not connected to the internet
- When the user requests to view the details of a capture
- Then the system should attempt to retrieve the capture details that were last accessed and stored in the cache
- If the details exist in the cache, the system should display the capture details
- If the details do not exist in the cache, the system should not display internet connection error
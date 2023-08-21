## Remote Load Picture Details With Local Fallback

> **Success Case**
1. The system attempts to execute the local `loadByPicture` implementation.
2. If the picture doesn't exist locally, the system executes the remote `loadByPicture` implementation.
3. The system saves the obtained data in the Cache.
4. The system returns this data.

> **Exception - Any Other Error**
1. The system validates the cache data.
2. The system loads data from the cache.
3. The system returns this data.

> **Exception - Error Fetching Cache Data**
1. The system throws an unexpected error exception.
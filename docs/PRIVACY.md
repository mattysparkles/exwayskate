# Privacy

All features are offline-first. Data is only uploaded when the corresponding setting is enabled and environment variables are provided.

| Toggle | Data Uploaded |
| --- | --- |
| Cloud sync | Ride summaries (no raw samples) hashed user id |
| Share hazards | Hazard type, coarse (~100m) location, hashed user id |
| Community sync | Event metadata and creator hash |
| Predictive range (external) | Polyline and timestamp |

User identifiers are hashed with a random per-install salt. Hazard coordinates are rounded to 3 decimals (~100m). "Delete cloud data" removes local records and issues a best-effort DELETE to the server.

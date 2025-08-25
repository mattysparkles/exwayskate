# API Stubs

Example JSON payloads for mock endpoints.

## POST /rides
```json
{
  "rides": [
    {
      "id": "r1",
      "started_at": 0,
      "ended_at": 1,
      "distance_m": 1000,
      "avg_speed_mps": 3.0,
      "max_speed_mps": 5.0,
      "updated_at": 1
    }
  ]
}
```

## GET /rides?since=cursor
```json
{ "rides": [ ... ], "cursor": 2 }
```

## GET /leaderboard?period=30d
```json
{ "entries": [ {"id_hash":"abc","miles_total":42,"rides_count":5,"last_ride_at":1} ] }
```

## Community Events
```json
{ "events": [ {"id":"e1","title":"Group Ride","start_ts":0,"end_ts":1,"updated_at":1} ] }
```

## Hazards
```json
{ "hazards": [ {"id":"h1","type":"pothole","ts":0,"lat":1.23,"lon":4.56,"severity":3,"updated_at":1} ] }
```

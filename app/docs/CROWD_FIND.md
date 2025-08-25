# Crowd Find

Sightings of a locked board are stored in the `crowd_sightings` table. If the
`XRAY_CROWD_URL` environment variable is set, coarse sightings (6 char hash and
rounded location) are uploaded to help locate lost boards. Mock sightings can be
generated from **Settings → Developer → Generate mock sighting**.

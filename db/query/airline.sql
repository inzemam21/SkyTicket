-- name: CreateAirline :one
INSERT INTO Airlines (
  name,
  iata_code,
  icao_code
) VALUES (
  $1, $2, $3
) RETURNING *;
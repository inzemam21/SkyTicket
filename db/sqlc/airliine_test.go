package db

import (
	"context"
	"database/sql"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateAirline(t *testing.T) {
	args := CreateAirlineParams{
		Name:     "American Airline",
		IataCode: sql.NullString{String: "adb", Valid: true},
		IcaoCode: sql.NullString{String: "adb", Valid: true},
	}

	airline, err := testQueries.CreateAirline(context.Background(), args)

	require.NoError(t, err)
	require.NotEmpty(t, airline)
}

// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package db

import (
	"context"
)

type Querier interface {
	CreateAirline(ctx context.Context, arg CreateAirlineParams) (Airline, error)
}

var _ Querier = (*Queries)(nil)
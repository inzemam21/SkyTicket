// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package db

import (
	"database/sql"
	"time"
)

type Airline struct {
	ID       int32          `json:"id"`
	Name     string         `json:"name"`
	IataCode sql.NullString `json:"iata_code"`
	IcaoCode sql.NullString `json:"icao_code"`
}

type Airport struct {
	ID       int32          `json:"id"`
	Name     string         `json:"name"`
	IataCode sql.NullString `json:"iata_code"`
	IcaoCode sql.NullString `json:"icao_code"`
	City     sql.NullString `json:"city"`
	Country  sql.NullString `json:"country"`
}

type Booking struct {
	ID          int32         `json:"id"`
	FlightID    sql.NullInt32 `json:"flight_id"`
	UserID      sql.NullInt32 `json:"user_id"`
	BookingDate sql.NullTime  `json:"booking_date"`
	Status      string        `json:"status"`
}

type Flight struct {
	ID                 int32         `json:"id"`
	AirlineID          sql.NullInt32 `json:"airline_id"`
	DepartureAirportID sql.NullInt32 `json:"departure_airport_id"`
	ArrivalAirportID   sql.NullInt32 `json:"arrival_airport_id"`
	DepartureTime      time.Time     `json:"departure_time"`
	ArrivalTime        time.Time     `json:"arrival_time"`
	Duration           sql.NullInt64 `json:"duration"`
	Capacity           int32         `json:"capacity"`
	Price              string        `json:"price"`
}

type Passenger struct {
	ID        int32          `json:"id"`
	BookingID sql.NullInt32  `json:"booking_id"`
	Name      string         `json:"name"`
	Email     sql.NullString `json:"email"`
	Phone     sql.NullString `json:"phone"`
}

type Payment struct {
	ID            int32         `json:"id"`
	BookingID     sql.NullInt32 `json:"booking_id"`
	PaymentMethod string        `json:"payment_method"`
	PaymentDate   sql.NullTime  `json:"payment_date"`
	Amount        string        `json:"amount"`
}

type User struct {
	ID       int32  `json:"id"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

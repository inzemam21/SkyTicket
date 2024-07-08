-- Airlines table
CREATE TABLE Airlines (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    iata_code VARCHAR(3) UNIQUE,
    icao_code VARCHAR(4) UNIQUE
);

-- Airports table
CREATE TABLE Airports (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    iata_code VARCHAR(3) UNIQUE,
    icao_code VARCHAR(4) UNIQUE,
    city VARCHAR(255),
    country VARCHAR(255)
);

-- Flights table
CREATE TABLE Flights (
    id SERIAL PRIMARY KEY,
    airline_id INT REFERENCES Airlines(id),
    departure_airport_id INT REFERENCES Airports(id),
    arrival_airport_id INT REFERENCES Airports(id),
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    duration INTERVAL,
    capacity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Users table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL -- This should be hashed
);

-- Bookings table
CREATE TABLE Bookings (
    id SERIAL PRIMARY KEY,
    flight_id INT REFERENCES Flights(id),
    user_id INT REFERENCES Users(id),
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL -- e.g., "pending", "confirmed", "cancelled"
);

-- Passengers table
CREATE TABLE Passengers (
    id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES Bookings(id),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Payments table
CREATE TABLE Payments (
    id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES Bookings(id),
    payment_method VARCHAR(50) NOT NULL, -- e.g., "credit card", "PayPal"
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL
);

-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  code TEXT UNIQUE,
  name TEXT UNIQUE
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  seat_number TEXT UNIQUE
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  code TEXT NOT NULL,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  code TEXT NOT NULL,
  name TEXT NOT NULL UNIQUE,
  country INTEGER NOT NULL REFERENCES countries(id) ON DELETE SET NULL
);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat INTEGER NOT NULL REFERENCES seats(id) ON DELETE SET NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines(id) ON DELETE SET NULL,
  from_city INTEGER REFERENCES cities(id) ON DELETE SET NULL,
  from_country INTEGER REFERENCES countries(id) ON DELETE SET NULL,
  to_city INTEGER REFERENCES cities(id) ON DELETE SET NULL,
  to_country INTEGER REFERENCES countries(id) ON DELETE SET NULL
);

INSERT INTO airlines(code, name)
VALUES
  ('united', 'United'),
  ('delta','Delta'),
  ('bri-air', 'British Airways'),
  ('tui-bel', 'TUI Fly Belgium'),
  ('air-chi', 'Air China'),
  ('ame-air','American Airlines'),
  ('avi-bra', 'Avianca Brasil');

  INSERT INTO countries(code,name)
VALUES
('us','United States'),
('brazil', 'Brazil'),
('japan','Japan'),
('fr','France'),
('uk','United Kingdom'),
('mex','Mexico'),
('moroc','Morocco'),
('chile','Chile'),
('china','China'),
('uae','United Arab Emirates');

INSERT INTO cities(code,name,country)
VALUES
  ('dc', 'Washington DC', 1),
  ('tokyo', 'Tokyo', 3),
  ('angeles','Los Angeles', 1),
  ('seattle', 'Seattle', 1),
  ('paris', 'Paris', 4),
  ('london','London', 1),
  ('vegas','Las Vegas', 1),
  ('mxcity','Mexico City', 6),
  ('casabl','Casablanca', 7),
  ('charl','Charlotte', 1),
  ('chic','Chicago', 1),
  ('dubai','Dubai', 10),
  ('beij','Bejing', 9),
  ('nyork','New York', 1),
  ('norleans', 'New Orleans', 1),
  ('cerapids', 'Cedar Rapids', 1),
  ('spaolo', 'Sao Paolo', 2),
  ('santia', 'Santiago', 8);


INSERT INTO seats(seat_number)
VALUES 
  ('33B'),
  ('8A'),
  ('12F'),
  ('20A'),
  ('23D'),
  ('18C'),
  ('9E'),
  ('1A'),
  ('32B'),
  ('10D');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ('Jennifer', 'Finch', 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 4, 1),
  ('Thade1', 'Gathercoal', 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 2, 3, 6, 5),
  ('Sonja', 'Pauley', 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 2, 3, 1, 7, 1),
  ('Jennifer', 'Finch', 4, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 4, 1, 8, 6),
  ('Waneta', 'Skeleton', 5, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 4, 9, 7),
  ('Cory', 'Squibbes', 10, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 2, 18, 8);
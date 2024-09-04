create database universe;
CREATE TABLE galaxy (
    galaxy_id int PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    distance_from_earth NUMERIC(10, 2) NOT NULL,
    number_of_stars INT NOT NULL,
    contains_black_hole BOOLEAN NOT NULL
);


INSERT INTO galaxy (galaxy_id, name, distance_from_earth, number_of_stars, contains_black_hole)
VALUES
(1, 'Andromeda', 2537000.00, 1000000000, TRUE),
(2, 'Milky Way', 0.00, 300000000, TRUE),
(3, 'Triangulum', 3000000.00, 40000000, FALSE),
(4, 'Whirlpool', 23000000.00, 50000000, TRUE),
(5, 'Messier 87', 53000000.00, 100000000, TRUE),
(6, 'Large Magellanic Cloud', 1630000.00, 100000000, FALSE),
(7, 'Small Magellanic Cloud', 2000000.00, 70000000, FALSE),
(8, 'Sombrero', 28000000.00, 50000000, TRUE),
(9, 'Pinwheel', 21000000.00, 200000000, TRUE),
(10, 'Bodes Galaxy', 13000000.00, 30000000, FALSE);





CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    composition TEXT
);
INSERT INTO asteroid (name, composition) VALUES
('Ceres', 'Rocky and icy, with a significant amount of water ice'),
('Vesta', 'Silicate rock with metal-rich core'),
('Pallas', 'Combination of silicate rock and metal, possibly with a carbon-rich outer layer');

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) NOT NULL,
    radius_km INT NOT NULL,
    has_atmosphere BOOLEAN NOT NULL
);
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,
    luminosity INT NOT NULL,  -- Arbitrary unit for brightness
    is_main_sequence BOOLEAN NOT NULL
);

INSERT INTO star (name, galaxy_id, luminosity, is_main_sequence)
VALUES
('Sun', 1, 100, TRUE),
('Proxima Centauri', 1, 0.0017, TRUE),
('Betelgeuse', 1, 100000, FALSE),
('Sirius', 1, 25.4, TRUE),
('Alpha Centauri A', 1, 1.52, TRUE),
('Vega', 1, 40, TRUE);


CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) NOT NULL,
    distance_from_star NUMERIC(10, 2) NOT NULL,  -- Distance in AU
    has_life BOOLEAN NOT NULL
);





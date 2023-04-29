-- EXTRA CREDIT QUESTION 2: CREATING 3NF TRAINER TABLES

-- Create table Trainer. 
CREATE TABLE trainer (
  trainer_id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(80),
  last_name VARCHAR(80)
);

-- Create table favorite_pokemon_type. 
CREATE TABLE favorite_pokemon_type (
  trainer_id INTEGER REFERENCES trainer(trainer_id),
  type_id INTEGER REFERENCES type(type_id),
  PRIMARY KEY (trainer_id, type_id)
);

-- Create table pokemon_team. 
CREATE TABLE pokemon_team (
  team_id INTEGER PRIMARY KEY AUTOINCREMENT,
  trainer_id INTEGER REFERENCES trainer(trainer_id),
  team_name VARCHAR(50)
);

-- Create table team_member. 
CREATE TABLE team_member (
  team_id INTEGER REFERENCES pokemon_team(team_id),
  pokedex_number INTEGER REFERENCES pokemon(pokedex_number),
  team_member_id INTEGER,
  PRIMARY KEY (team_id, pokedex_number)
);

-- Insert trainers into trainer table. 
INSERT INTO trainer (first_name, last_name) VALUES
('Hrudhai', 'Umas'),
('Ted', 'Neward'),
('Justin', 'Dong'),
('Kaarina', 'Tulleau'),
('Kaden', 'Kapadia'),
('Arushi', 'Agarwal'),
('Grace', 'Lee'),
('Henry', 'Miller'),
('Isaac', 'Robinson'),
('Jasmine', 'Taylor');

-- Insert trainer's favorite pokemon types. 
INSERT INTO favorite_pokemon_type (trainer_id, type_id) VALUES
(1, 3), (1, 5), (2, 8), (2, 2), (3, 18), (3, 16), (4, 14), (5, 12), (6, 4), (7, 15),
(8, 1), (8, 4), (9, 13), (9, 19), (10, 6), (10, 7);

-- Insert trainer's pokemon_team. 
INSERT INTO pokemon_team (trainer_id, team_name) VALUES
(1, 'Team A'),
(2, 'Team B'),
(3, 'Team C'),
(4, 'Team D'),
(5, 'Team E'),
(6, 'Team F'),
(7, 'Team G'),
(8, 'Team H'),
(9, 'Team I'),
(10, 'Team J');

-- Insert trainer's pokemons into team_member. 
INSERT INTO team_member VALUES
(1, 2, 1), (1, 45, 2), (1, 22, 3), (1, 33, 4), (1, 43, 5),
(2, 20, 1), (2, 200, 2), (2, 204, 3), (2, 183, 4), (2, 289, 5), (2, 345, 6),
(3, 100, 1), (3, 458, 2), (3, 799, 3), (3, 267, 4),
(4, 25, 1), (4, 26, 2), (4, 27, 3),
(5, 150, 1), (5, 151, 2), (5, 249, 3), (5, 250, 4),
(6, 10, 1), (6, 13, 2), (6, 16, 3), (6, 19, 4), (6, 22, 5),
(7, 14, 1), (7, 17, 2), (7, 20, 3),
(8, 30, 1), (8, 33, 2), (8, 36, 3), (8, 39, 4), (8, 42, 5),
(9, 60, 1), (9, 63, 2), (9, 66, 3),
(10, 123, 1), (10, 124, 2), (10, 125, 3), (10, 126, 4), (10, 127, 5);
-- Second Normal Form 
    -- Rule 1: Fuilfil 1NF.
    -- Rule 2: Partial Dependency. 

-- Dropping table 1NF Pokemon table to create 2NF pokemon table.
DROP TABLE IF EXISTS pokemon;

-- Creating 2NF Pokemon table.
CREATE TABLE pokemon (
    against_bug REAL,
    against_dark REAL,
    against_dragon REAL,
    against_electric REAL,
    against_fairy REAL,
    against_fight REAL,
    against_fire REAL,
    against_flying REAL,
    against_ghost REAL,
    against_grass REAL,
    against_ground REAL,
    against_ice REAL,
    against_normal REAL,
    against_poison REAL,
    against_psychic REAL,
    against_rock REAL,
    against_steel REAL,
    against_water REAL,
    attack INTEGER,
    base_egg_steps INTEGER,
    base_happiness INTEGER,
    base_total INTEGER,
    capture_rate INTEGER,
    defense INTEGER,
    experience_growth INTEGER,
    height_m REAL,
    hp INTEGER,
    name TEXT,
    percentage_male REAL,
    pokedex_number INTEGER PRIMARY KEY,
    sp_attack INTEGER,
    sp_defense INTEGER,
    speed INTEGER,
    weight_kg REAL,
    generation INTEGER,
    is_legendary INTEGER,
    abilities TEXT, 
    classfication TEXT, 
    type1 TEXT, 
    type2 TEXT
);

-- Insert data into pokemon table from the imported_pokemon_data table (Table created from CSV). 
INSERT INTO pokemon (
    against_bug, against_dark, against_dragon, against_electric, against_fairy,
    against_fight, against_fire, against_flying, against_ghost, against_grass,
    against_ground, against_ice, against_normal, against_poison, against_psychic,
    against_rock, against_steel, against_water, attack, base_egg_steps,
    base_happiness, base_total, capture_rate, defense, experience_growth, height_m,
    hp, name, percentage_male, pokedex_number, sp_attack, sp_defense, speed,
    weight_kg, generation, is_legendary, abilities, classfication, type1, type2
)
SELECT
    against_bug, against_dark, against_dragon, against_electric, against_fairy,
    against_fight, against_fire, against_flying, against_ghost, against_grass,
    against_ground, against_ice, against_normal, against_poison, against_psychic,
    against_rock, against_steel, against_water, attack, base_egg_steps,
    base_happiness, base_total, capture_rate, defense, experience_growth, height_m,
    hp, name, percentage_male, pokedex_number, sp_attack, sp_defense, speed,
    weight_kg, generation, is_legendary, abilities, classfication, type1, type2
FROM imported_pokemon_data;

-- Updating the capture rate of the pokemon with pokedex_number 774 as it had text value in an integer attribute type.
UPDATE pokemon SET capture_rate = 285 WHERE pokedex_number=774;

-- Creating a linking table pokemon_abilities to link pokemon to abilties. 
CREATE TABLE pokemon_abilities(
    ability_id REFERENCES abilities(ability_id), 
    pokedex_number REFERENCES pokemon(pokedex_number)
);

-- Inserting into pokemon_abilities table linking pokemon to its abilities. 
INSERT INTO pokemon_abilities(ability_id, pokedex_number)
SELECT a.ability_id, p.pokedex_number
FROM abilities a
JOIN pokemon p ON p.abilities LIKE '%' || a.ability_desc || '%';
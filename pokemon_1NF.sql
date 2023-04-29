--https://docs.google.com/presentation/d/1kdXqHMlOGK6yovFPIUzLGghZRaSQCPQwuGrpObhK_0Q/edit?usp=sharing


-- FIRST NORMAL FORM 
    -- Rule 1: Each Column should contain atomic values
    -- Rule 2: A Column should contain values that are of the same type
    -- Rule 3: The created table, Pokemon, has unique atribute names.
    -- Rule 4: Order in which data is stored does not matter.

-- Creating a table 1NF Pokemon table. 
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
    pokedex_number INTEGER,
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

-- Create table for abilities to fuilfil rule one.
CREATE TABLE abilities (
    ability_id INTEGER PRIMARY KEY AUTOINCREMENT,
    ability_desc TEXT
);

-- Splitting the abilities so that the abilities column values are atomic and stored in a new table. 
-- More information on how the code works on slide deck. 
WITH split(abilities, next_ability) AS 
    (SELECT '' AS abilities, abilities||',' AS next_ability
    FROM pokemon
    UNION ALL
        SELECT 
            substr(next_ability, 0, instr(next_ability, ',')) AS abilities, 
            substr(next_ability, instr(next_ability, ',') +1) AS next_ability
        FROM split 
        WHERE next_ability !=''
)
INSERT INTO abilities(ability_desc)
SELECT DISTINCT replace(replace(replace(abilities, '[', ''), ']', ''), '''', '') AS abilities
FROM split
WHERE abilities !='';

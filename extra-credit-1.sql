--EXTRA CREDIT QUESTION 1


-- a) 
    --Write a SQL script that adds "Huskichu", a "Mascot"-type Pokemon. You may decide for yourself what attacks it has. 
    --It has no evolution form. (Huskichu Pokemon are very good, they rival Mew and Mewtwo in power--make sure your 
    --data reflects this!)

    -- Identified Lugia to be rival for Mew and Mewto and refelecting that data below for Huskichu.

    -- Insert new type of Pokemon into type1 table. 
    INSERT INTO type1 (type1_desc)
    SELECT 'Mascot'
    WHERE NOT EXISTS (SELECT 1 FROM type1 WHERE type1_desc = 'Mascot');

    -- Insert new Pokemon into pokemon table
    INSERT INTO pokemon(name, generation, type1_id, pokedex_number, capture_rate, experience_growth, height_m, hp, percentage_male, speed, weight_kg, is_legendary, classfication_id, type2_id)
    SELECT 'Huskichu', 1, (SELECT type1_id FROM type1 WHERE type1_desc = 'Mascot'), (SELECT MAX(pokedex_number) + 1 FROM pokemon), capture_rate, experience_growth, height_m, hp, percentage_male, speed, weight_kg, is_legendary, classfication_id, (SELECT type2_id FROM type2 WHERE type2_desc='') FROM pokemon WHERE pokedex_number=249;

    -- Insert into pokemon_attack table
    INSERT INTO pokemon_attack(attack, sp_attack, pokedex_number)
    SELECT 175, 195, pokedex_number FROM pokemon WHERE name='Huskichu';

    -- Insert into pokemon_defense table
    INSERT INTO pokemon_defense(defense, sp_defense, pokedex_number)
    SELECT defense, sp_defense, (SELECT pokedex_number FROM pokemon WHERE name='Huskichu') FROM pokemon_defense WHERE pokedex_number=249;

    -- Insert into pokemon_against table
    INSERT INTO pokemon_against(against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, pokedex_number)
    SELECT against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, (SELECT pokedex_number FROM pokemon WHERE name='Huskichu') FROM pokemon_against WHERE pokedex_number=249;

    -- Insert into pokemon_base table
    INSERT INTO pokemon_base(base_egg_steps, base_happiness, base_total, pokedex_number)
    SELECT base_egg_steps, base_happiness, base_total, (SELECT pokedex_number FROM pokemon WHERE name='Huskichu') FROM pokemon_base WHERE pokedex_number=249;

    -- Insert into abilities table
    INSERT INTO abilities(ability_desc, pokedex_number)
    SELECT ability_desc, (SELECT pokedex_number FROM pokemon WHERE name='Huskichu') FROM abilities WHERE pokedex_number=249;


-- b) 
    -- Write another SQL script that adds "Cougarite", another "Mascot"-type Pokemon. Cougarites have one attack, 
    -- a "Slow Attack", which does no damage. (Cougarite Pokemon are not very good. They lose to Magikarp in most battles.)


    -- Identified Shuckle to be the pokemon with slow attack for Cougarite.

    -- Insert new Pokemon into pokemon table
    INSERT INTO pokemon(name, generation, type1_id, pokedex_number, capture_rate, experience_growth, height_m, hp, percentage_male, speed, weight_kg, is_legendary, classfication_id, type2_id)
    SELECT 'Cougarite', 1, (SELECT type1_id FROM type1 WHERE type1_desc = 'Mascot'), (SELECT MAX(pokedex_number) + 1 FROM pokemon), capture_rate, experience_growth, height_m, hp, percentage_male, speed, weight_kg, is_legendary, classfication_id, (SELECT type2_id FROM type2 WHERE type2_desc='') FROM pokemon WHERE pokedex_number=213;

    -- Insert into pokemon_attack table with attack of 0. 
    INSERT INTO pokemon_attack(attack, sp_attack, pokedex_number)
    SELECT 0, 0, pokedex_number FROM pokemon WHERE name='Cougarite';

    -- Insert into pokemon_defense table
    INSERT INTO pokemon_defense(defense, sp_defense, pokedex_number)
    SELECT defense, sp_defense, (SELECT pokedex_number FROM pokemon WHERE name='Cougarite') FROM pokemon_defense WHERE pokedex_number=213;

    -- Insert into pokemon_against table
    INSERT INTO pokemon_against(against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, pokedex_number)
    SELECT against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water, (SELECT pokedex_number FROM pokemon WHERE name='Cougarite') FROM pokemon_against WHERE pokedex_number=213;

    -- Insert into pokemon_base table
    INSERT INTO pokemon_base(base_egg_steps, base_happiness, base_total, pokedex_number)
    SELECT base_egg_steps, base_happiness, base_total, (SELECT pokedex_number FROM pokemon WHERE name='Cougarite') FROM pokemon_base WHERE pokedex_number=213;

    -- Insert into abilities table
    INSERT INTO abilities(ability_desc, pokedex_number)
    SELECT ability_desc, (SELECT pokedex_number FROM pokemon WHERE name='Cougarite') FROM abilities WHERE pokedex_number=213;

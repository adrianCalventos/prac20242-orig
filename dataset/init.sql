DROP TABLE IF EXISTS recipes;
CREATE TABLE recipes (
    url VARCHAR(250),
    image VARCHAR(250),
    name VARCHAR(250),
    description TEXT,
    rattings INT,
    t_prepartion VARCHAR(100),
    t_cooking VARCHAR(100),
    difficult VARCHAR(100)
);

COPY recipes
FROM '/docker-entrypoint-initdb.d/recipes-data.csv'
DELIMITER ';'
CSV HEADER;


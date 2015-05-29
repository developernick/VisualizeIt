
CREATE DATABASE visual_data;
\c visual_data

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(255),
	password_hash VARCHAR(255)
);

-- CREATE TABLE visuals (
-- 	id SERIAL PRIMARY KEY,
-- 	name VARCHAR(255),
-- 	user_id INTEGER
-- );

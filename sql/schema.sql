-- books table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(20) NOT NULL,
  archived BOOLEAN DEFAULT false,
  author_id INTEGER,
  genre_id INTEGER,
  label_id INTEGER,
  FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE SET NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE SET NULL,
  FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE SET NULL
);

-- labels table
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(50) NOT NULL
);

-- authors table
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

-- genres table
CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Games Table
CREATE TABLE game(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,
  multiplayer BOOLEAN NOT NULL,  
  last_played_at DATE NOT NULL 
);

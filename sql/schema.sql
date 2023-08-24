CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    published_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT,
    author_id INT,
    label_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE,
    FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    publisher VARCHAR(300),
    cover_state VARCHAR(300),
    label_id INT,
    genre_id INT,
    author_id INT,
    published_date DATE,
    FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(300),
    last_name VARCHAR(300)
);

CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    color VARCHAR(50) NOT NULL
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    on_spotify BOOLEAN NOT NULL,
    label_id INT,
    genre_id INT,
    author_id INT,
    published_date DATE,
    FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    multiplayer VARCHAR(100) NOT NULL,
    last_played_at DATE NOT NULL,
    label_id INT,
    genre_id INT,
    author_id INT,
    published_date DATE,
    FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE
);

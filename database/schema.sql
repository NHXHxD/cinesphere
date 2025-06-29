CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    google_id VARCHAR(255) UNIQUE,
    profile_image_url VARCHAR(512),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    role VARCHAR(20) DEFAULT 'user'
);

CREATE TABLE playlists (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE playlist_items (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT,
    movie_id VARCHAR(255) NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    poster TEXT,
    year VARCHAR(4),
    rating FLOAT DEFAULT 0,
    FOREIGN KEY (playlist_id) REFERENCES playlists(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_ratings (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_id VARCHAR(255) NOT NULL,
    rating INT,
    rated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(255),
    poster TEXT,
    year INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
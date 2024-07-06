CREATE DATABASE harsyaduas;
USE harsyaduas;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255), -- Panjang hash sandi dapat disesuaikan
    role ENUM('Admin', 'User')
);

-- Insert minimal 3 data pengguna
INSERT INTO users (username, password, role) VALUES
('Harsyad', 'rahasiaasad', 'Admin'),
('Drake', 'kdot', 'User'),
('Kendrick', 'passionfruit', 'User');

CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    birthdate DATE,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data profil pengguna
INSERT INTO profiles (user_id, full_name, birthdate, bio) VALUES
(1, 'Teuku Muhammad Harsyad Ilham Hast', '2003-10-07', 'Nothing.'),
(2, 'Drake', '2003-09-08', 'I love music.'),
(3, 'Kendrick lamar', '2003-08-08', 'they not like us');

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data postingan
INSERT INTO posts (user_id, title, content) VALUES
(1, 'Who ever move first is G', 'stevelacy'),
(2, 'its always been about love and hate','now let me say im the biggest hater'),
(3, 'i hate the way that u walk', 'the way that u talk');

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(1000),
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data komentar
INSERT INTO comments (post_id, user_id, comment_text) VALUES
(1, 2, 'its really damn trend.'),
(1, 3, 'drake funeral.'),
(2, 1, 'the best diss ever');

SELECT u.username, p.full_name, p.bio
FROM users u
JOIN profiles p ON u.id = p.user_id;


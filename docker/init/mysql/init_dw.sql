-- dim_level
CREATE TABLE IF NOT EXISTS dim_level (
    level_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    level VARCHAR(50) NOT NULL
);

-- dim_subject
CREATE TABLE IF NOT EXISTS dim_subject (
    subject_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(255) NOT NULL
);

-- dim_paid
CREATE TABLE IF NOT EXISTS dim_paid (
    paid_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    is_paid VARCHAR(10) NOT NULL
);

-- Tabela Fato: fact_courses
CREATE TABLE IF NOT EXISTS fact_courses (
    course_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    published_date TIMESTAMP NOT NULL,
    course_title VARCHAR(255) NOT NULL,
    level_key INT UNSIGNED,
    subject_key INT UNSIGNED,
    paid_key INT UNSIGNED,
    price FLOAT,
    num_subscribers INT,
    num_reviews INT,
    num_lectures INT,
    content_duration FLOAT,
    FOREIGN KEY (level_key) REFERENCES dim_level(level_key),
    FOREIGN KEY (subject_key) REFERENCES dim_subject(subject_key),
    FOREIGN KEY (paid_key) REFERENCES dim_paid(paid_key)
);
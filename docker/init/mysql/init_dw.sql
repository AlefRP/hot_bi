-- Tabela Dimensão: dim_course
CREATE TABLE IF NOT EXISTS dim_course (
    course_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_title VARCHAR(255) NOT NULL,
    url TEXT NOT NULL,
    is_paid BOOLEAN NOT NULL
);

-- Tabela Dimensão: dim_time
CREATE TABLE IF NOT EXISTS dim_time (
    time_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    published_timestamp TIMESTAMP,
    year INT,
    month INT,
    day INT
);

-- Tabela Dimensão: dim_level
CREATE TABLE IF NOT EXISTS dim_level (
    level_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    level VARCHAR(50) NOT NULL
);

-- Tabela Dimensão: dim_subject
CREATE TABLE IF NOT EXISTS dim_subject (
    subject_key INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(255) NOT NULL
);

-- Tabela Fato: fact_courses
CREATE TABLE IF NOT EXISTS fact_courses (
    course_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_key INT UNSIGNED,
    time_key INT UNSIGNED,
    level_key INT UNSIGNED,
    subject_key INT UNSIGNED,
    price VARCHAR(50),
    num_subscribers INT,
    num_reviews INT,
    num_lectures INT,
    content_duration FLOAT,
    FOREIGN KEY (course_key) REFERENCES dim_course(course_key),
    FOREIGN KEY (time_key) REFERENCES dim_time(time_key),
    FOREIGN KEY (level_key) REFERENCES dim_level(level_key),
    FOREIGN KEY (subject_key) REFERENCES dim_subject(subject_key)
);
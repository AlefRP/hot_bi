-- Criar tabela courses
CREATE TABLE IF NOT EXISTS courses (
    course_id SERIAL PRIMARY KEY,
    course_title VARCHAR(255) NOT NULL,
    url TEXT NOT NULL,
    is_paid BOOLEAN NOT NULL,
    price VARCHAR(50),
    num_subscribers INT,
    num_reviews INT,
    num_lectures INT,
    level VARCHAR(50),
    content_duration FLOAT,
    published_timestamp TIMESTAMP,
    subject VARCHAR(255)
);

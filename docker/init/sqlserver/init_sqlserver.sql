-- Criar tabela courses
CREATE TABLE courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_title NVARCHAR(255) NOT NULL,
    url NVARCHAR(MAX) NOT NULL,
    is_paid BIT NOT NULL,
    price NVARCHAR(50),
    num_subscribers INT,
    num_reviews INT,
    num_lectures INT,
    level NVARCHAR(50),
    content_duration FLOAT,
    published_timestamp DATETIME,
    subject NVARCHAR(255)
);
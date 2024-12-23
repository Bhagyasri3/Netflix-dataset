CREATE TABLE Netflix (
  show_id VARCHAR(255) NOT NULL,
  type VARCHAR(20) NOT NULL,
  title VARCHAR(255) NOT NULL,
  director VARCHAR(255),
  cast VARCHAR(255),
  country VARCHAR(255),
  date_added DATE,
  release_year INT,
  rating VARCHAR(10),
  duration VARCHAR(10),
  listed_in VARCHAR(255),
  description TEXT,
  PRIMARY KEY (show_id)
);


LOAD DATA INFILE 'C:\Users\S555187\Downloads\netflix_titles.csv'
INTO TABLE Netflix
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\


LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\netflix_titles.csv'
INTO TABLE Netflix
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

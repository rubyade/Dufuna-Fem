-- Creating the Database
CREATE DATABASE berlin_transports;
SHOW DATABASES;

-- Creating the Tables
USE berlin_transports;
CREATE TABLE passenger_details (
	id INT NOT NULL AUTO_INCREMENT,
	full_name VARCHAR(50) NOT NULL,
	sex VARCHAR(8) NOT NULL,
	age TINYINT NOT NULL,
   	PRIMARY KEY (id)
);
SHOW COLUMNS from passenger_details;

CREATE TABLE travel_details (
	id INT NOT NULL AUTO_INCREMENT,
	passenger_class VARCHAR(10),
	passenger_ticket_number VARCHAR(20),
	passenger_detail_id INT NOT NULL,
	trip_fare DECIMAL(10,2),
	assigned_cabin VARCHAR(10),
	spouses_aboard TINYINT NOT NULL,
	children_aboard TINYINT NOT NULL,
	parents_aboard TINYINT NOT NULL,
	siblings_aboard TINYINT NOT NULL,
	embarkation_port VARCHAR(30) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (passenger_detail_id) REFERENCES passenger_details (id)
);
SHOW COLUMNS FROM travel_details;

CREATE TABLE flight_statuses  (
		id INT NOT NULL AUTO_INCREMENT,
		passenger_detail_id INT NOT NULL,
		travel_detail_id INT NOT NULL,
		survived BOOLEAN,       
		PRIMARY KEY (id),	
		FOREIGN KEY (passenger_detail_id) REFERENCES passenger_details (id),
		FOREIGN KEY (travel_detail_id) REFERENCES travel_details (id)
   );
   SHOW COLUMNS FROM flight_statuses;
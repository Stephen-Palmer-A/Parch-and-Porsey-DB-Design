--CREATE TABLES/ENTITIES

CREATE TABLE accounts(id SERIAL PRIMARY KEY,
      Name VARCHAR(225),Website VARCHAR(255),
	  Lat DECIMAL(8,6),Long DECIMAL(9,6),
	  Primary_poc VARCHAR(255),Sales_rep_id
	  SERIAL);

CREATE TABLE web_events(id SERIAL PRIMARY KEY,
      account_id SERIAL,ooccurred_at TIMESTAMP,channel VARCHAR(50));
	  
CREATE TABLE sales_rep(id SERIAL PRIMARY KEY,
      name VARCHAR(255),regional_id SERIAL);

CREATE TABLE regional(id SERIAL PRIMARY KEY,
      name VARCHAR(255));

CREATE TABLE orders(id SERIAL PRIMARY KEY,account_id SERIAL,
      standard_qty INTEGER,poster_qty SERIAL,total INTEGER,standard_amt_usd
      NUMERIC(10,2),gloss_amt_usd NUMERIC(10,2),poster_amt_usd
	  NUMERIC(10,2),total_amt_usd NUMERIC(10,2));

--MAKE CHANGES TO THE TABLE

ALTER TABLE accounts ADD FOREIGN KEY(sales_rep_id)
REFERENCES sales_rep(id);

ALTER TABLE web_events ADD FOREIGN KEY(account_id)
REFERENCES accounts(id);

ALTER TABLE orders 	ADD FOREIGN KEY (account_id)
REFERENCES accounts(id);

ALTER TABLE sales_rep ADD FOREIGN KEY(regional_id)
REFERENCES regional(id);



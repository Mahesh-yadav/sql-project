-- TABLES

-- This table stores all the information about the individual parts in our storeroom.
CREATE TABLE parts(
  id SERIAL PRIMARY KEY,
  description varchar(50) NOT NULL UNIQUE,
  code varchar(10) NOT NULL UNIQUE,
  manufacturer_id integer REFERENCES manufacturers(id)
);

--  This table stores information about the locations of a part for all the parts available in our storeroom.
CREATE TABLE locations(
  id SERIAL PRIMARY KEY,
  part_id integer REFERENCES parts(id),
  location varchar(50),
  qty integer,
  UNIQUE (part_id, location)
);

CREATE TABLE manufacturers(
  id SERIAL PRIMARY KEY,
  name varchar(30)
);

-- This table keeps track of the parts, quantities, and prices available from their manufacturers.
CREATE TABLE reorder_options(
  id SERIAL PRIMARY KEY,
  part_id integer REFERENCES parts(id),
  price_usd money NOT NULL CHECK (price_usd > 0),
  quantity integer NOT NULL CHECK (quantity > 0),
  CHECK (price_usd / quantity >= 0.02 AND price_usd/quantity <= 25.00)
);

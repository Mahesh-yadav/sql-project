/*
  Relationships:

  One-to-One   =>   restaurant <-> address

  One-to-Many  =>   restaurant <-> review

  Many-to_many =>   dish <-> category
*/

CREATE TABLE restaurant(
  id integer PRIMARY KEY,
  name varchar(30),
  description varchar(100),
  telephone char(10),
  rating decimal,
  hours varchar(100)
);

CREATE TABLE address(
  id integer PRIMARY KEY,
  street_number varchar(10),
  street_name varchar(20),
  city varchar(20),
  state char(2),
  zip integer,
  google_map_link varchar(50),
  restaurant_id integer REFERENCES restaurant(id) UNIQUE
);

CREATE TABLE category(
  id char(2) PRIMARY KEY,
  name varchar(20),
  description varchar(200)
);

CREATE TABLE dish(
  id integer PRIMARY KEY,
  name varchar(50),
  description varchar(200),
  hot_and_spicy boolean
);

CREATE TABLE review(
  id integer PRIMARY KEY,
  rating decimal,
  description varchar(200),
  date date,
  restaurant_id integer REFERENCES restaurant(id)
);

CREATE TABLE categories_dishes(
  category_id char(2) REFERENCES category(id),
  dish_id integer REFERENCES dish(id),
  price money,
  PRIMARY KEY(category_id, dish_id)
);



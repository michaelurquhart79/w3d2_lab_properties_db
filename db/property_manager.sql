DROP TABLE IF EXISTS properties;

CREATE TABLE properties(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT8,
  year_built INT2,
  build VARCHAR(255)

);

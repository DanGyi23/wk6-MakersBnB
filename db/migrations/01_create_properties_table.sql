CREATE TABLE properties (id SERIAL PRIMARY KEY, property_name TEXT, property_description TEXT, price_per_night INTEGER, property_type TEXT, capacity INTEGER, location VARCHAR(40), availability BOOLEAN, size_sqm INTEGER, beds_number INTEGER, bathrooms_number INTEGER, wifi BOOLEAN, washing_machine BOOLEAN);
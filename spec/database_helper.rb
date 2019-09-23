def truncate_test_database
  p "Exterminating content in all databases... / wiping hard drive..."
  conn = PG.connect(dbname: 'makersbnb_test')
  conn.exec("TRUNCATE properties;")
end

def create_test_rows
  p "Adding test data"
  conn = PG.connect(dbname: 'makersbnb_test')
  conn.exec("INSERT INTO properties VALUES (default, 'Bens place', 'Bens fantastic place etc etc etc etc', 99, 'entire flat', 4, 'London', true, 100, 2, 2, true, true);")
  conn.exec("INSERT INTO properties VALUES (default, 'Volkers place', 'Volkers great place etc etc etc etc', 97, 'shared flat', 4, 'Berlin', true, 90, 2, 2, true, true);")
  conn.exec("INSERT INTO properties VALUES (default, 'Dans place', 'Dans awesome place etc etc etc etc', 97, 'entire flat', 4, 'London', true, 101, 2, 3, false, true);")
end
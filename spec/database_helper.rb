def truncate_test_database
  p 'Exterminating content in all databases... / wiping hard drive...'
  conn = PG.connect(dbname: 'makersbnb_test')
  conn.exec('TRUNCATE properties;')
  conn.exec('TRUNCATE users;')
end

def create_test_rows
  p 'Adding test data'


  conn = PG.connect(dbname: 'makersbnb_test')
  Properties.addnew(property_name: 'Bens place', price: '99', property_type: 'Apartment', property_description: 'Bens fantastic place etc etc etc etc', capacity: '4', location: 'London', size: '100', bathrooms: '2', beds: '2', wifi: 'TRUE', washing_machine: 'TRUE')
  Properties.addnew(property_name: 'Volkers place', price: '97', property_type: 'shared flat', property_description: 'Volkers great place etc etc etc etc', capacity: '4', location: 'Berlin', size: '90', bathrooms: '2', beds: '2', wifi: 'TRUE', washing_machine: 'TRUE')
  Properties.addnew(property_name: 'Dans place', price: '97', property_type: 'entire flat', property_description: 'Dans awesome place etc etc etc etc', capacity: '4', location: 'London', size: '101', bathrooms: '2', beds: '3', wifi: 'TRUE', washing_machine: 'TRUE')
end

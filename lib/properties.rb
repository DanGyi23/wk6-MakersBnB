require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'
require './lib/payment.rb'
require 'date'

# manages properties
class Properties
  def self.all_properties
    @all_properties = []
    result = DatabaseConnection.query("select * from properties where availability = 'TRUE';")
    result.map { |properties| @all_properties << properties }
    @all_properties
    #
  end

  def self.get_property(id:)
    @property = []
    result = DatabaseConnection.query("select * from properties where id = #{id}")
    result.map { |properties| @property = properties }
    @property
  end

  def self.property_info(id:, date: )
    p "property info id:"
    p id
    property = Properties.get_property(id: id)
    a = {}
    a['property_name'] = property['property_name']
    a['message'] = 'Confirmed'
    a['date'] = date
    a['id'] = id
    a['payment_session_id'] = Payment.initiate(property['property_name'],property['property_description'], property['price_per_night'].to_i).id


    a

  end

  def self.get_availability(id:)
    @dates = []

    result = DatabaseConnection.query("SELECT DATE FROM bookings#{id} WHERE availability = TRUE;")
    p "get_availavility result"
    p result
    result.map do |date|
        p date
        @dates << date

    end
    @dates

  end

  def self.change_availability(id:, date:)
    DatabaseConnection.query("UPDATE bookings#{id} SET availability = FALSE WHERE date = '#{date}'")
  end

  def self.addnew(property_name:, price:, property_type:, property_description:, capacity:, location:, size:, bathrooms:, beds:, wifi:, washing_machine:)
    result = DatabaseConnection.query("INSERT INTO properties (property_name, property_description, price_per_night, property_type, capacity, location, availability, size_sqm, beds_number, bathrooms_number, wifi, washing_machine) VALUES ('#{property_name}', '#{property_description}', '#{price}', '#{property_type}', '#{capacity}', '#{location}', 'TRUE', '#{size}', '#{beds}', '#{bathrooms}', '#{wifi}', '#{washing_machine}') RETURNING id")
    DatabaseConnection.query("CREATE TABLE bookings#{result[0]['id']} (date TEXT, availability BOOLEAN DEFAULT TRUE);")
    DatabaseConnection.query("INSERT INTO bookings#{result[0]['id']} (date) SELECT generate_series(date '2019-09-26', date '2019-10-10', interval '1 day');")
  end
end

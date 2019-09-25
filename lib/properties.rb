require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'
require 'date'

# manages properties
class Properties
  def self.all_properties
    @all_properties = []
    result = DatabaseConnection.query("select * from properties where availability = 't'")
    result.map { |properties| @all_properties << properties }
    @all_properties
  end

  def self.get_property(id:)
    result = DatabaseConnection.query("select * from properties where id = #{id}")
    result.map { |properties| @property = properties }
    @property
  end

  def self.book_property(id:)
    DatabaseConnection.query("UPDATE properties SET availability = 'f' where id = #{id}")
    property = Properties.get_property(id: id)
    a = {}
    a['property_name'] = property['property_name']
    a['date'] = Date.today.strftime('%a, %e %b %Y')
    a['message'] = 'Confirmed'
    a['id'] = id
    a
  end

  def self.addnew(price:, property_type:, propert_description:, capacity:, location:, size:, bathrooms:, beds:, wifi:, washing_machine:)
    DatabaseConnection.query("INSERT INTO properties (property_name, property_description, price_per_night, property_type, capacity, location, availability, size_sqm, beds_number, bathrooms_number, wifi, washing_machine) VALUES ('#{property_name}', '#{propert_description}', '#{price_per_night}', '#{property_type}', '#{capacity}', '#{location}', 'TRUE', '#{size}', '#{beds}', '#{bathrooms}', '#{wifi}', '#{washing_machine}'")
  end
end

require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'
require 'date'

class Properties

  def self.all_properties
    @all_properties = []
    result = DatabaseConnection.query('select * from properties')
    result.map { |properties| @all_properties << properties }
    return @all_properties
  end

  def self.get_property(id:)
    result = DatabaseConnection.query("select * from properties where id = #{id}")
    result.map { |properties| @property = properties }
    return @property
  end

  def self.book_property(id:)
    db_update = DatabaseConnection.query("UPDATE properties SET availability = 'f' where id = #{id}")
    property = Properties.get_property(id: id)
    a = {}
    a['property_name'] = property['property_name']
    a['date'] = Date.today.strftime("%a, %e %b %Y")
    a['message'] = 'Confirmed'
    a['id'] = id
    return a
  end
end

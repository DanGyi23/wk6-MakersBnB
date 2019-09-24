require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'


class Properties

  def self.all_properties
    @all_properties = []
    result = DatabaseConnection.query('select * from properties')
    result.map { |properties| @all_properties << properties }
    return @all_properties
  end

  def self.get_property(id:)
    @property = []
    result = DatabaseConnection.query("select * from properties where id = #{id}")
    result.map { |properties| @property << properties }
    return @property
  end

  def self.book_property(id:)
    result = DatabaseConnection.query("UPDATE properties SET availability = 'f' where id = #{id}")
  end
end

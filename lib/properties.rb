require './lib/database_connection.rb'
require './lib/database_connection_setup.rb'


class Properties

  def self.all
    @all_properties = []
    result = DatabaseConnection.query('select * from properties')
    result.map { |properties| @all_properties << properties }
    return @all_properties
  end

end

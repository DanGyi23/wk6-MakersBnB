require 'pg'

# set ups db  connection to test or production database
class DatabaseConnection
  def self.setup(database)
    @conn = PG.connect(dbname: database)
  end

  def self.conn
    @conn
  end

  def self.query(sql_query)
    @conn.exec(sql_query)
  end
end

require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('secret_santa')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name FROM names;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end
require_relative './name.rb'
require_relative '../spec/spec_helper'

class NameRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT name, postcode FROM names;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    names = []
    
    result_set.each do |record|
      name = Name.new
      name.name = record['name']
      name.postcode = record['postcode']
    names << name
    end
    return names
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end
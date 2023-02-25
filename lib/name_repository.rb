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
    sql = 'SELECT name, postcode FROM names WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    record = result[0]
    name = Name.new
    name.name = record['name']
    name.postcode = record['postcode']
    return name
  end

  def create(name)
    sql = 'INSERT INTO names (name, postcode) VALUES ($1, $2);'
    params = [name.name, name.postcode]
    DatabaseConnection.exec_params(sql, params)
  end

  # def update(student)
  # end

  # def delete(student)
  # end
end
require_relative '../lib/name_repository.rb'

def reset_names_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'secret_santa_test' })
  connection.exec(seed_sql)
end

RSpec.describe NameRepository do
  before(:each) do 
    reset_names_table
  end

  it 'gets all names' do
    repo = NameRepository.new
    names = repo.all
    expect(names.length).to eq 9
    expect(names[0].name).to eq 'Simon'
    expect(names[0].postcode).to eq 'CB1 1AA'
  end

  it 'gets a specific name' do
    repo = NameRepository.new
    expect(repo.find(1).name).to eq 'Simon'
  end

end

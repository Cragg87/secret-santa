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

  it 'returns all entries' do
    repo = NameRepository.new
    names = repo.all
    expect(names.length).to eq 9
    expect(names[0].name).to eq 'Simon'
    expect(names[0].postcode).to eq 'CB1 1AA'
  end

  it 'returns a specific entry' do
    repo = NameRepository.new
    expect(repo.find(1).name).to eq 'Simon'
  end

  it 'adds a new entry' do
    repo = NameRepository.new
    new_name = Name.new
    new_name.name = 'Joseph'
    new_name.postcode = 'CB1 1AA'
    
    repo.create(new_name)

    names = repo.all
    last_name = names.last
    expect(last_name.name).to eq 'Joseph'
    expect(last_name.postcode).to eq 'CB1 1AA'
  end

  it 'returns all entries with the same postcode' do
    repo = NameRepository.new
    results = repo.find_by_postcode('CB1 1AA')
    expect(results.length).to eq 2
    expect(results[0].name).to eq 'Simon'
    expect(results[1].name).to eq 'Sam'
  end

  it 'returns all entries except those with given postcode' do
    repo = NameRepository.new
    results = repo.find_by_different_postcode('CB1 1AA')
    expect(results.length).to eq 7
    expect(results[0].name).to eq 'Lauren'
    expect(results[1].name).to eq 'Miles'
    expect(results.last.name).to eq 'Pete'
  end
end

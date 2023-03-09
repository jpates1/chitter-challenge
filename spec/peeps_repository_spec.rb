require "peeps_repository"

def reset_peeps_table
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepsRepository do
  before(:each) do 
    reset_peeps_table
  end

  it "gets all peeps" do
    repo = PeepsRepository.new

    peeps = repo.all
    
    expect(peeps.length).to eq 3
    
    expect(peeps[0].id).to eq ('1')
    expect(peeps[0].message).to eq ('A good day')
    expect(peeps[0].time_of_post).to eq ('2023-03-09 10:15:30.123456')
    expect(peeps[0].user_id).to eq ('1')
    
    expect(peeps[0].id).to eq ('2')
    expect(peeps[0].message).to eq ('A bad day')
    expect(peeps[0].time_of_post).to eq ('2023-03-08 10:15:30.123456')
    expect(peeps[0].user_id).to eq ('2')
  end
end
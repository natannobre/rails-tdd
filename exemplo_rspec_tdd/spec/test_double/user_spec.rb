describe 'Test Double' do
  it 'create' do
    abc = double('User')
    allow(abc).to receive_messages(name: 'Jack', password: 'secret')
    allow(abc).to receive(:age).and_return(23)
    puts abc.inspect
    p abc.name
    p abc.password
    p abc.age
  end
end
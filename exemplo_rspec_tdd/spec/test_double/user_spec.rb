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

  it 'as_null_object' do
    user = double('User').as_null_object
    allow(user).to receive(:name).and_return('Jack')
    allow(user).to receive(:password).and_return('secret')
    puts user.inspect
    p user.name
    p user.password
    p user.abc
  end
end
$counter = 0

describe 'let' do
  let(:count) { $counter += 1 }

  it 'memoriza o valor' do
    expect(count).to eq(1) # 1ª vez -> carrega
    expect(count).to eq(1) # 2ª vez -> cache
  end

  it 'não é cacheado entre os testes' do
    expect(count).to eq(2) # 3ª ou 1ª deste teste -> carrega
  end
end
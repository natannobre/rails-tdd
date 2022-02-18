require 'pessoa'

shared_examples 'status' do |sentimento|
  it "#{sentimento}" do
    pessoa.send("#{sentimento}!")
    expect(pessoa.status).to eq("Sentindo-se #{sentimento.capitalize}")
  end
end

describe 'Pessoa' do
  subject(:pessoa) { Pessoa.new }

  # 3 opções de helpers para serem utilizados na importação
  it_behaves_like 'status', :feliz
  it_should_behave_like 'status', :triste
  include_examples 'status', :contente

  # it 'feliz' do
  #   pessoa.feliz!
  #   expect(pessoa.status).to eq ('Sentindo-se Feliz')
  # end

  # it 'triste' do
  #   pessoa.triste!
  #   expect(pessoa.status).to eq ('Sentindo-se Triste')
  # end

  # it 'contente' do
  #   pessoa.contente!
  #   expect(pessoa.status).to eq ('Sentindo-se Contente')
  # end
end
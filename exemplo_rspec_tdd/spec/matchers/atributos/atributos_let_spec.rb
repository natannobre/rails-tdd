require 'pessoa'

describe 'Atributos' do

  # before(:each) do
  #   @pessoa = Pessoa.new
  # end

  let(:pessoa) { Pessoa.new } # Instancia a variável na primeira vez que é usada

  it 'have_attributes using let' do
    pessoa.nome = "Jackson"
    pessoa.idade = 20

    expect(pessoa).to have_attributes(nome: starting_with('J'), idade: (a_value >= 20))
  end

  it 'have_attributes using let' do
    pessoa.nome = "Jose"
    pessoa.idade = 25

    expect(pessoa).to have_attributes(nome: starting_with('J'), idade: (a_value >= 20))
  end
end
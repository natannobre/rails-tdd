require 'calculator'

describe Calculator do
  it 'use sum method for two numbers' do
    calc = Calculator.new
    result = calc.sum(5, 7)
    expect(result).to eq(12)

    result = calc.sum(5, 5)
    expect(result).to eq(10)
  end

  specify 'use sum method for two numbers (with negative number)' do
    calc = Calculator.new
    result = calc.sum(-5, 7)
    expect(result).to eq(2)

    result = calc.sum(5, -5)
    expect(result).to eq(0)
  end
end

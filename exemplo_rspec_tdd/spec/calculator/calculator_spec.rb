require 'calculator'

describe Calculator do
  context '#sum' do
    it 'with positive number' do
      calc = Calculator.new
      result = calc.sum(5, 7)
      expect(result).to eq(12)

      result = calc.sum(5, 5)
      expect(result).to eq(10)
    end

    it 'with negative number' do
      calc = Calculator.new
      result = calc.sum(-5, -7)
      expect(result).to eq(-12)

      result = calc.sum(-5, -5)
      expect(result).to eq(-10)
    end

    it 'with negative and positive numbers' do
      calc = Calculator.new
      result = calc.sum(5, -7)
      expect(result).to eq(-2)

      result = calc.sum(-5, 5)
      expect(result).to eq(0)
    end
  end
end

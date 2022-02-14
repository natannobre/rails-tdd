require 'calculator'

describe Calculator, "Testing Calculator's Methods" do
  subject(:calc) { described_class.new } # subject explícito

  context '#sum' do
    it 'with positive number' do
      result = calc.sum(5, 7)
      expect(result).to eq(12)

      result = calc.sum(5, 5)
      expect(result).to eq(10)
    end

    it 'with negative number' do
      result = calc.sum(-5, -7)
      expect(result).to eq(-12)

      result = calc.sum(-5, -5)
      expect(result).to eq(-10)
    end

    it 'with negative and positive numbers' do
      result = calc.sum(5, -7)
      expect(result).to eq(-2)

      result = calc.sum(-5, 5)
      expect(result).to eq(0)
    end

    xspecify 'with numbers'
  end
end

require 'calculator'

describe Calculator, "Testing Calculator's Methods" do
  subject(:calc) { described_class.new } # subject explícito

  context '#sum' do
    it 'with positive number' do
      result = calc.sum(5, 7)
      expect(result).to eq(12)
    end

    it 'with negative number' do
      result = calc.sum(-5, -7)
      expect(result).to eq(-12)
    end

    it 'with negative and positive numbers' do
      result = calc.sum(5, -7)
      expect(result).to eq(-2)
    end
  end

  context '#div' do
    # it 'divide by 0' do
    #   expect { calc.div(3, 0) }.to raise_exception # Erro genérico
    # end

    it 'divide by 0' do
      expect { calc.div(3, 0) }.to raise_error(ZeroDivisionError)
      expect { calc.div(3, 0) }.to raise_error('divided by 0')
      expect { calc.div(3, 0) }.to raise_error(ZeroDivisionError, 'divided by 0')
      expect { calc.div(3, 0) }.to raise_error(/divided/)
    end

  end
end

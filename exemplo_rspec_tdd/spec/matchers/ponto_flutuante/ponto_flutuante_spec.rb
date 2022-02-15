RSpec::Matchers.define_negated_matcher :not_be_within, :be_within

describe 'be_within' do
  it { expect(11.5).to be_within(0.5).of(12)  }
  it { expect([11.6, 12.1, 12.4]).to all(be_within(0.5).of(12)) }
  it { expect(11.4).to not_be_within(0.5).of(12)  }
end
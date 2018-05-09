
require_relative '../../metapro/alphanumeric.rb'

describe 'first test' do
  it 'strip' do
    expect(to_alphanumeric('#3, the *Magic, Number*?')).to eq '3 the Magic Number'
  end
end

describe String do
  describe '#to_alphanumeric' do
    it 'strip' do
      expect('#3, the *Magic, Number*?'.to_alphanumeric).to eq '3 the Magic Number'
    end
  end

  describe '#to_alphanumeric_with_refine' do
    it 'no include' do
      expect { '#3, the *Magic, Number*?'.to_alphanumeric_with_refine }.to raise_error(NoMethodError)
    end
  end
end

describe ExpandString do
  describe '#to_alphanumeric' do
    it 'strip' do
      expand_string = ExpandString.new
      expect(expand_string.to_alphanumeric('#3, the *Magic, Number*?')).to eq '3 the Magic Number'
    end
  end
end



require_relative '../lib/problem2.rb'

describe Child do
  let(:child) { Child.new }

  describe '#input_tall' do
    it 'input less' do
      child.input_tall('le', 120.3)
      child.input_tall('le', 119.3)
      child.input_tall('le', 121.3)
      expect(child.less_tall).to eq 119.3
    end

    it 'input greater' do
      child.input_tall('ge', 120.3)
      child.input_tall('ge', 119.3)
      child.input_tall('ge', 121.3)
      expect(child.greater_tall).to eq 121.3
    end
  end

  describe '#output_tall' do
    it 'output1' do
      child.input_tall('le', 120.3)
      child.input_tall('ge', 115.7)
      child.input_tall('le', 122.0)
      child.input_tall('ge', 116.9)
      child.input_tall('le', 119.1)
      child.input_tall('le', 117.6)
      expect(child.output_tall).to eq '116.9 117.6'
    end

    it 'output2' do
      values = [['ge', 121.7], ['ge', 125.0], ['le', 162.4], ['le', 153.5],
                ['ge', 119.6], ['le', 182.4], ['le', 149.4], ['le', 192.7],
                ['le', 168.8], ['ge', 110.0], ['le', 180.9], ['ge', 119.9],
                ['le', 152.7], ['le', 180.8], ['le', 152.4]]
      values.each { |pattern, tall| child.input_tall(pattern, tall) }
      expect(child.output_tall).to eq '125.0 149.4'
    end
  end
end

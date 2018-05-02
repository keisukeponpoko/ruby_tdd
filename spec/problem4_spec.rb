
require_relative '../lib/problem4.rb'

describe Unagi do
  let(:unagi) { Unagi.new(block_radius) }

  describe '#initialize' do
    let(:block_radius) { 2 }
    it 'initialize' do
      expect(unagi.block_size).to eq 5
    end
  end

  describe '#input_order' do
    context 'size = 2' do
      let(:block_radius) { 2 }

      it 'order1' do
        unagi.input_order([1, 1, 4])
        expect(unagi.answer).to eq ['L', 'L', 'R']
      end
    end
  end

  describe '#input_order' do
    context 'size = 5' do
      let(:block_radius) { 5 }

      it 'order1' do
        unagi.input_order([4, 9, 6, 3])
        expect(unagi.answer).to eq ['L', 'R', 'L', 'L']
      end
    end
  end
end


require_relative '../lib/problem3.rb'

describe Magic do
  let(:magic) { Magic.new(size) }

  describe '#initialize' do
    let(:size) { 3 }
    it 'initialize' do
      expect(magic.box).to eq [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    end
  end

  describe '#detective' do
    context 'size = 3' do
      let(:size) { 3 }

      it 'no detective' do
        magic.detective([6, 1, 8, 7, 5, 3, 2, 9, 4])
        expect(magic.box).to eq [[6, 1, 8], [7, 5, 3], [2, 9, 4]]
      end

      it 'many number put error' do
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        expect { magic.detective(numbers) }.to raise_error('error many numbers')
      end

      it 'detective1' do
        numbers = [6, 1, 8, 7, 5, 3, 2, 0, 0]
        magic.detective(numbers)
        expect(magic.box).to eq [[6, 1, 8], [7, 5, 3], [2, 9, 4]]
      end
    end

    context 'size = 5' do
      let(:size) { 5 }
      it 'detective2' do
        numbers = [1, 15, 8, 24, 0, 19, 3, 21, 12, 10, 13, 0, 20, 6, 4, 25, 9, 2, 18, 11, 7, 16, 14, 5, 23]
        magic.detective(numbers)
        expect(magic.box).to eq [
                                    [1, 15, 8, 24, 17],
                                    [19, 3, 21, 12, 10],
                                    [13, 22, 20, 6, 4],
                                    [25, 9, 2, 18, 11],
                                    [7, 16, 14, 5, 23]
                                ]
      end
    end
  end
end

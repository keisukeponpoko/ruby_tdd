
require_relative '../lib/problem5.rb'

describe Tetris do
  let(:tetris) { Tetris.new(height, width) }

  context 'height:7, width:10' do
    let(:height) { 7 }
    let(:width) { 10 }
    describe '#initialize' do
      it 'initialize' do
        expect(tetris.box.size).to eq 7
        expect(tetris.box[0].size).to eq 10
      end
    end

    describe '#add_block' do
      it '1block' do
        tetris.add_block(1, 8, 1)
        expect(tetris.box).to eq [
                                    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                    ['.', '#', '#', '#', '#', '#', '#', '#', '#', '.']
                                  ]
      end
      it 'many block' do
        tetris.add_block(1, 8, 1)
        tetris.add_block(4, 1, 5)
        tetris.add_block(1, 6, 2)
        tetris.add_block(2, 2, 0)
        expect(tetris.box).to eq [
                                     ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
                                     ['.', '.', '#', '#', '#', '#', '#', '#', '.', '.'],
                                     ['.', '.', '.', '.', '.', '#', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '.', '#', '.', '.', '.', '.'],
                                     ['#', '#', '.', '.', '.', '#', '.', '.', '.', '.'],
                                     ['#', '#', '.', '.', '.', '#', '.', '.', '.', '.'],
                                     ['.', '#', '#', '#', '#', '#', '#', '#', '#', '.']
                                 ]
      end
    end
  end

  context 'height:10, width:10' do
    let(:height) { 10 }
    let(:width) { 10 }
    describe '#add_block' do
      it 'many block' do
        tetris.add_block(2, 2, 4)
        tetris.add_block(2, 2, 3)
        tetris.add_block(2, 2, 5)
        tetris.add_block(2, 2, 2)
        tetris.add_block(2, 2, 6)
        tetris.add_block(2, 2, 1)
        tetris.add_block(2, 2, 7)
        tetris.add_block(2, 2, 0)
        tetris.add_block(2, 2, 8)
        expect(tetris.box).to eq [
                                     ['#', '#', '.', '.', '.', '.', '.', '.', '#', '#'],
                                     ['#', '#', '.', '.', '.', '.', '.', '.', '#', '#'],
                                     ['.', '#', '#', '.', '.', '.', '.', '#', '#', '.'],
                                     ['.', '#', '#', '.', '.', '.', '.', '#', '#', '.'],
                                     ['.', '.', '#', '#', '.', '.', '#', '#', '.', '.'],
                                     ['.', '.', '#', '#', '.', '.', '#', '#', '.', '.'],
                                     ['.', '.', '.', '#', '#', '#', '#', '.', '.', '.'],
                                     ['.', '.', '.', '#', '#', '#', '#', '.', '.', '.'],
                                     ['.', '.', '.', '.', '#', '#', '.', '.', '.', '.'],
                                     ['.', '.', '.', '.', '#', '#', '.', '.', '.', '.'],
                                 ]
        end
    end
  end
end

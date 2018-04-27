
require_relative '../lib/problem1.rb'

describe Counter do
  describe '#add_id' do
    it 'confirm add id' do
      counter = Counter.new
      counter.add_id(2)
      counter.add_id(3)
      counter.add_id(3)
      expect(counter.id_list).to eq [2, 3, 3]
    end
  end

  describe '#output_frequent_id' do
    it 'output frequent id for one answer' do
      counter = Counter.new
      [1, 2, 3, 3, 4, 3, 4].each do |i|
        counter.add_id(i)
      end
      expect(counter.output_frequent_id).to eq '3'
    end

    it 'output frequent id for many answer' do
      counter = Counter.new
      [1, 3, 3, 3, 4, 2, 4, 2, 2, 4].each do |i|
        counter.add_id(i)
      end
      expect(counter.output_frequent_id).to eq '2 3 4'
    end

    it 'output frequent id for many answer' do
      counter = Counter.new
      [1, 32, 3, 34, 5, 6, 27, 8, 9, 10, 11].each do |i|
        counter.add_id(i)
      end
      expect(counter.output_frequent_id).to eq '1 3 5 6 8 9 10 11 27 32 34'
    end
  end
end

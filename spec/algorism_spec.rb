
require_relative '../algorism/sort.rb'

describe Sort do
  SUCCESS_MESSAGE = '400 は input[400]で発見しました！'.freeze
  FAILED_MESSAGE = '1100 は見つかりませんでした..'.freeze

  let(:sort) { Sort.new(key, input) }

  describe '#check search available' do
    let(:input) { (0..1000).to_a }
    context 'find' do
      let(:key) { 400 }
      it 'linear_search' do
        expect(sort.linear_search).to eq SUCCESS_MESSAGE
      end
      it 'binary_search' do
        expect(sort.binary_search).to eq SUCCESS_MESSAGE
      end
    end

    context 'not find' do
      let(:key) { 1100 }
      it 'linear_search' do
        expect(sort.linear_search).to eq FAILED_MESSAGE
      end
      it 'binary_search' do
        expect(sort.binary_search).to eq FAILED_MESSAGE
      end
    end
  end

  describe '#check sort available' do
    let(:input) { [42, 21, 10, 2, 30, 51, 80, 90, 18, 56, 50, 25, 15, 95, 44, 69] }
    let(:key) { 1 }

    SORT_ANSWER_LIST = [2, 10, 15, 18, 21, 25, 30, 42, 44, 50, 51, 56, 69, 80, 90, 95]

    it 'bubble_sort' do
      expect(sort.bubble_sort).to eq SORT_ANSWER_LIST
    end
    it 'selection_sort' do
      expect(sort.selection_sort).to eq SORT_ANSWER_LIST
    end
    it 'insertion_sort' do
      expect(sort.insertion_sort).to eq SORT_ANSWER_LIST
    end
    it 'merge_sort' do
      expect(sort.merge_sort).to eq SORT_ANSWER_LIST
    end
    it 'quick_sort' do
      expect(sort.quick_sort).to eq SORT_ANSWER_LIST
    end
    it 'heap_sort' do
      expect(sort.heap_sort).to eq SORT_ANSWER_LIST
    end
  end
end

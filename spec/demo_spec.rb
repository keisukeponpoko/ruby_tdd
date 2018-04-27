
require_relative '../lib/demo.rb'

describe Demo do
  describe '#initialize' do
    it '初期化' do
      demo = Demo.new
      expect(demo.problem_count).to eq 0
    end
  end

  describe '#add_count' do
    it '問題を追加する' do
      demo = Demo.new
      demo.add_count(2)
      expect(demo.problem_count).to eq 2
    end
  end
end

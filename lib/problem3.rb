
class Magic
  attr_reader :box
  def initialize(size)
    @size = size
    @box = Array.new(size).map{ Array.new(size, 0) }
    @zero_points = []
  end

  def detective(numbers)
    input_box(numbers)
    replace_zero
  end

  private

  def input_box(numbers)
    @size.times do |i|
      @size.times do |j|
        number = numbers.shift
        @zero_points.push([i, j]) if number.zero?
        @box[i][j] = number
      end
    end

    raise 'error many numbers' unless numbers.empty?
  end

  def replace_zero
    sum = calculate_standard_sum

    @zero_points.each do |i, j|
      zero_count = @box[i].count(0)
      raise 'zero points invalid' unless [1, 2].include?(zero_count)

      sum_with_zero = zero_count == 1 ? @box[i].sum : @box.transpose[j].sum
      @box[i][j] = sum - sum_with_zero
    end
  end

  def calculate_standard_sum
    @box.map { |n| n.inject(:+) }.max
  end
end

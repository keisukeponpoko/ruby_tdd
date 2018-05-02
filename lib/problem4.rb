class Unagi
  attr_reader :block_size, :answer
  DIRECTION_LIST = ['L', 'R']

  def initialize(block_radius)
    @block_size = block_radius * 2 + 1
    @position = block_radius
  end

  def input_order(numbers)
    DIRECTION_LIST.repeated_permutation(numbers.size) do |order|
      if check_correct(order, numbers)
        @answer = order
        break
      end
    end
  end

  private

  def check_correct(order, numbers)
    position = @position
    order.each_with_index do |direction, index|
      if direction == 'L'
        position -= numbers[index]
      elsif direction == 'R'
        position += numbers[index]
      else
        raise 'invalid direction'
      end

      return false if position.negative? || position >= @block_size
    end

    true
  end
end

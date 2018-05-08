
class Tetris
  attr_reader :box

  def initialize(height, width)
    @box_height = height
    @box_width = width
    @box = Array.new(height).map { Array.new(width, '.') }
  end

  def add_block(block_height, block_width, left_length)
    top_length = @box_height - 1
    put_top_length = get_can_put_position(
      block_height, block_width, top_length, left_length
    )
    put_block(block_height, block_width, put_top_length, left_length)

    show_block
  end

  def show_block
    @box.each do |b|
      puts b.join('')
    end
    puts ''
  end

  private

  def get_can_put_position(block_height, block_width, top_length, left_length)
    put_top_length = 0
    (0..top_length).each do |t_length|
      block_height.times do |i|
        block_width.times do |j|
          return put_top_length if @box[t_length + i].nil? || @box[t_length + i][left_length + j] == '#'
        end
      end
      put_top_length = t_length
    end

    put_top_length
  end

  def put_block(block_height, block_width, top_length, left_length)
    block_height.times do |i|
      block_width.times do |j|
        @box[top_length + i][left_length + j] = '#'
      end
    end
  end
end

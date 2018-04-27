
class Child
  attr_reader :less_tall, :greater_tall
  def input_tall(pattern, tall)
    if pattern == 'ge'
      input_greater_than(tall)
    elsif pattern == 'le'
      input_less_than(tall)
    else
      raise 'no available pattern'
    end
  end

  def output_tall
    "#{@greater_tall} #{@less_tall}"
  end

  private

  def input_greater_than(tall)
    @greater_tall = tall if !@greater_tall || @greater_tall < tall
  end

  def input_less_than(tall)
    @less_tall = tall if !@less_tall || tall < @less_tall
  end
end


class Demo
  attr_reader :problem_count
  def initialize
    @problem_count = 0
  end

  def add_count(problem_count)
    @problem_count += problem_count
  end
end

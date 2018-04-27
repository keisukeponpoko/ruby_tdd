
class Counter
  attr_reader :id_list
  def initialize
    @id_list = []
  end

  def add_id(id)
    @id_list.push(id)
  end

  def output_frequent_id
    find_frequent_ids.sort.join(' ')
  end

  private

  def find_frequent_ids
    id_count_display = {}
    @id_list.group_by { |i| i }.each do |id, ids|
      if id_count_display[ids.count]
        id_count_display[ids.count].push(id)
      else
        id_count_display[ids.count] = [id]
      end
    end

    id_count_display.sort.reverse.first[1]
  end
end

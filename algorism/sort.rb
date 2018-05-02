# https://tech-camp.in/note/technology/1050/

class Sort
  def initialize(key, input)
    @key = key
    @input = input
  end

  def linear_search
    @input.length.times do |i|
      next unless @input[i] == @key
      return "#{@key} は input[#{i}]で発見しました！"
    end

    "#{@key} は見つかりませんでした.."
  end

  def binary_search
    left_end = 0
    right_end = @input.length - 1

    while left_end < right_end
      middle = (left_end + right_end) / 2

      return "#{@key} は input[#{middle}]で発見しました！" if @key == @input[middle]

      break if middle == left_end || middle == right_end

      left_end = middle if @input[middle] < @key
      right_end = middle if @key < @input[middle]
    end

    "#{@key} は見つかりませんでした.."
  end

  def bubble_sort()
    data = @input
    data.length.times do |i|
      (data.length - i).times do |j|
        next if j.zero?
        data[j - 1], data[j] = data[j], data[j - 1] if data[j - 1] > data[j]
      end
    end

    data
  end

  def selection_sort()
    data = @input
    data.length.times do |i|
      min_i = i
      ((i + 1)..(data.length - 1)).each do |j|
        min_i = j if data[min_i] > data[j]
      end
      data[min_i], data[i] = data[i], data[min_i]
    end

    data
  end

  def insertion_sort()
    data = @input
    (1..(data.length - 1)).each do |i|
      select = data[i]
      j = i
      loop do
        break if j <= 0 || data[j - 1] <= select
        data[j] = data[j - 1]
        j -= 1
      end
      data[j] = select
    end
    data
  end

  def merge_sort()
    data = @input
    _merge_sort(data)
  end

  def _merge_sort(data)
    return data if data.length <= 1

    split_array = data.each_slice(data.length / 2).to_a
    _merge(_merge_sort(split_array[0]), _merge_sort(split_array[1]))
  end

  def _merge(data1, data2)
    result = []
    item1 = data1[0]
    item2 = data2[0]
    loop do
      if item1 < item2
        result << data1.shift
        if data1.length.zero?
          result.concat(data2)
          break
        end
        item1 = data1[0]
      else
        result << data2.shift
        if data2.length.zero?
          result.concat(data1)
          break
        end
        item2 = data2[0]
      end
    end

    result
  end


  def quick_sort()
    data = @input
    _quick_sort(data)
  end

  def _quick_sort(data)
    return data if data.empty?

    pivot = data[0]
    left = []
    right = []
    (1..data.length - 1).each do |i|
      if data[i] <= pivot
        left << data[i]
      else
        right << data[i]
      end
    end
    left = _quick_sort(left)
    right = _quick_sort(right)

    left + [pivot] + right
  end

  def heap_sort()
    result = []
    data = @input
    data = _heap_sort(data)
    data.length.times do
      result << data.shift
      data = _heap_sort(data)
    end
    result
  end

  def _heap_sort(data)
    left = ->(i) { i * 2 + 1 }
    right = ->(i) { i * 2 + 2 }
    parent = ->(i) { (i - 1) / 2 }

    start = parent.call(data.length)

    until start <= 0
      i = start
      loop do
        if left.call(i) < data.length && data[i] > data[left.call(i)]
          data[i], data[left.call(i)] = data[left.call(i)], data[i]
        end
        if right.call(i) < data.length && data[i] > data[right.call(i)]
          data[i], data[right.call(i)] = data[right.call(i)], data[i]
        end
        break if i.zero?
        i = parent.call(i)
      end
      start -= 1
    end
    data
  end
end

class DS
  def get_cpu_info(id)
    1 * id
  end

  def get_cpu_price(id)
    100 * id
  end

  def get_mouse_ifo(id)
    2 * id
  end

  def get_mouse_price(id)
    50 * id
  end
end

# リファクタリング前コード
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def cpu
    info = @data_source.get_cpu_info(@id)
    price = @data_source.get_cpu_price(@id)
    puts "Cpu(#{info}): #{price}" if price > 100
  end

  def mouse
    info = @data_source.get_mouse_info(@id)
    price = @data_source.get_mouse_price(@id)
    puts "Mouse(#{info}): #{price}" if price > 100
  end
end


# 動的ディスパッチ追加
class Computer2
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def cpu
    component :cpu
  end

  def mouse
    component :mouse
  end

  def component(name)
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    puts "#{name.capitalize}(#{info}): #{price}" if price > 100
  end
end

# 動的メソッド利用
class Computer3
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      puts "#{name.capitalize}(#{info}): #{price}" if price > 100
    end
  end

  define_component :mouse
  define_component :cpu
end

# イントロスペクション
class Computer4
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) { Computer4.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      puts "#{name.capitalize}(#{info}): #{price}" if price > 100
    end
  end
end

# method_missing
class Computer5
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name)
    super unless @data_source.respond_to?("get_#{name}_info")
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    puts "#{name.capitalize}(#{info}): #{price}" if price > 100
  end

  def respond_to_missing?(method, include_private = false)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end

# method_missing with blankslate
class Computer6 < BasicObject
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super unless @data_source.respond_to?("get_#{name}_info")
    info = @data_source.send "get_#{name}_info", @id
    price = @data_source.send "get_#{name}_price", @id
    puts "#{name.capitalize}(#{info}): #{price}" if price > 100
  end

  def respond_to_missing?(method, include_private = false)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end

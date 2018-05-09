# Initial Implementation

class Entity
  attr_reader :table, :ident
  def initialize(table, ident)
    @table = table
    @ident = ident
    Database.sql "INSERT INTO #{@table} (id) VALUES (#{@ident})"
  end

  def set(col, val)
    Database.sql "UPDATE  #{@table} SET #{col}='#{val}' WHERE ID = #{@ident}"
  end

  def get(col)
    Database.sql("SELECT #{col} FROM #{@table} WHERE id=#{@indent}")[0][0]
  end
end

class Movie < Entity
  def initialize(ident)
    super 'movies', ident
  end

  def title
    get 'title'
  end

  def title=(value)
    set 'title', value
  end

  def director
    get 'director'
  end

  def director=(value)
    set 'director', value
  end
end

movie = Movie.new(1)
movie.title = '博士の異常な愛情'
movie.director = 'スタンリーキュービック'


# Improve Implementation
class Movie < ActiveRecord::Base; end

movie = Movie.create
movie.title = '博士の異常な愛情'
movie.director = 'スタンリーキュービック'

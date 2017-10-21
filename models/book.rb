require_relative('../db/sql_runner.rb')

class Book

  attr_reader :id
  attr_accessor :title, :author_id, :genre, :source_language, :buy_price, :sell_price

  def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @author_id = options['author_id']
  @genre = options['genre']
  @source_language = options['source_language']
  @buy_price = options['buy_price'].to_i
  @sell_price = options['sell_price'].to_i
end

def save
  sql = "INSERT INTO books (title, author_id, genre, source_language, buy_price, sell_price)
  VALUES ($1, $2, $3, $4, $5, $6) RETURNING *"
  values = [@title, @author_id, @genre, @source_language, @buy_price, @sell_price]
  result = SqlRunner.run(sql, values)[0]['id']
  @id = result.to_i
end

end

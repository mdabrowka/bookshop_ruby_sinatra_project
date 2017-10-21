require_relative('author.rb')
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

  def self.all
      sql = "SELECT * FROM books"
      values = []
      result = SqlRunner.run(sql, values)
      books = result.map{|book| Book.new(book)}
      return books
    end

    def author
       sql = "SELECT * FROM authors WHERE id = $1"
       values = [@id]
       results = SqlRunner.run(sql, values)[0]
       author = Author.new(results)
       return author.full_name
     end

     def self.delete_all()
       sql = "DELETE FROM books"
       values = []
       SqlRunner.run(sql, values)
      end

      def delete
        sql = "DELETE FROM books WHERE id = $1"
        values=[@id]
        SqlRunner.run(sql, values)
      end

      def update
       sql = "UPDATE books SET (title, author_id, genre, source_language, buy_price, sell_price) =
      ($1, $2, $3, $4, $5, $6 ) WHERE id = $7"
      values = [@title, @author_id, @genre, @source_language, @buy_price, @sell_price]
      SqlRunner.run(sql, values)
     end

     def self.find(id)
      sql = "SELECT * FROM books WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql,values)[0]
      book = Book.new(results)
      return book
    end



end

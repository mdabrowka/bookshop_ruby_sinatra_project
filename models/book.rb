require_relative('author.rb')
require_relative('genre.rb')
require_relative('../db/sql_runner.rb')

class Book

  attr_reader :id
  attr_accessor :title, :author_id, :quantity, :genre_id, :source_language, :buy_price, :sell_price

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @author_id = options['author_id'].to_i
      @quantity = options['quantity'].to_i
      @genre_id = options['genre_id'].to_i
      @source_language = options['source_language']
      @buy_price = options['buy_price'].to_i
      @sell_price = options['sell_price'].to_i
    end


  def save
    sql = "INSERT INTO books (title, author_id, quantity, genre_id, source_language, buy_price, sell_price)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *"
    values = [@title, @author_id, @quantity, @genre_id, @source_language, @buy_price, @sell_price]
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
       values = [@author_id]
       result = SqlRunner.run(sql, values)[0]
       author = Author.new(result)
      return author.full_name
     end

     def genre
        sql = "SELECT * FROM genre WHERE id = $1"
        values = [@genre_id]
        result = SqlRunner.run(sql, values)[0]
        genre = Genre.new(result)
       return genre.type
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
       sql = "UPDATE books SET (title, author_id, quantity, genre_id, source_language, buy_price, sell_price) =
      ($1, $2, $3, $4, $5, $6, $7 ) WHERE id = $8"
      values = [@title, @author_id, @quantity, @genre_id, @source_language, @buy_price, @sell_price, @id]
      SqlRunner.run(sql, values)
     end

     def self.find(id)
      sql = "SELECT * FROM books WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql,values)[0]
      book = Book.new(results)
      return book
    end

    def stock_level
       case
          when @quantity <= 5
            return "Low"
          when @quantity <= 15
             return "Medium"
          when @quantity > 15
             return "High"
        end
    end


    def markup
      result = ((@sell_price).to_f / (@buy_price).to_f) * 100
      return result
    end

end

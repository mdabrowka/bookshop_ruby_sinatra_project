require_relative('../db/sql_runner.rb')
require_relative('author.rb')
require_relative('genre.rb')
require_relative('source_language.rb')


class Book
attr_reader :id
attr_accessor :title, :author_id, :quantity, :genre_id, :source_language_id, :buy_price, :sell_price, :cover_image

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @author_id = options['author_id'].to_i
  @quantity = options['quantity'].to_i
  @genre_id = options['genre_id'].to_i
  @source_language_id = options['source_language_id'].to_i
  @buy_price = options['buy_price'].to_i
  @sell_price = options['sell_price'].to_i
  @cover_image = options['cover_image']
end


def save
  sql = "INSERT INTO books (title, author_id, quantity, genre_id, source_language_id, buy_price, sell_price, cover_image)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *"
  values = [@title, @author_id, @quantity, @genre_id, @source_language_id, @buy_price, @sell_price, @cover_image]
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

 def author #returns the author of the books
  sql = "SELECT * FROM authors WHERE id = $1"
  values = [@author_id]
  result = SqlRunner.run(sql, values)[0]
  author = Author.new(result)
  return author.full_name
end

def genre #returns the genre of the book
  sql = "SELECT * FROM genres WHERE id = $1"
  values = [@genre_id]
  result = SqlRunner.run(sql, values)[0]
  genre = Genre.new(result)
  return genre.type
end

def source_language #returns the source language of the book
  sql = "SELECT * FROM source_languages WHERE id = $1"
  values = [@source_language_id]
  result = SqlRunner.run(sql, values)[0]
  source_language = SourceLanguage.new(result)
  return source_language.language
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
   sql = "UPDATE books SET (title, author_id, quantity, genre_id, source_language_id, buy_price, sell_price, cover_image) =
   ($1, $2, $3, $4, $5, $6, $7, $8 ) WHERE id = $9"
   values = [@title, @author_id, @quantity, @genre_id, @source_language_id, @buy_price, @sell_price, @cover_image, @id]
   SqlRunner.run(sql, values)
 end

def self.find(id)
  sql = "SELECT * FROM books WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql,values)[0]
  book = Book.new(results)
  return book
end

 def check_cover_image #sets cover image to a default image if image not given -- you can set default cover image
    if @cover_image == ''
      @cover_image = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Blue_question_mark_icon.svg/2000px-Blue_question_mark_icon.svg.png'
    end
  end

def stock_level #returns a message according to the stock level// create message for stock level // function should always have a verb for being more explicit
 case
    when @quantity <= 5
      return "Low"
    when @quantity <= 15
       return "Medium"
    when @quantity > 15
       return "High"
  end
end

def markup #calculates markup and rounds it up to 2 decimal places
  result = ((@sell_price).to_f / (@buy_price).to_f).round(2) * 100
  return result
end

end

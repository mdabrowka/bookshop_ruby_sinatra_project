require_relative('../db/sql_runner.rb')
require_relative('author.rb')
require_relative('book.rb')
require_relative('source_language.rb')

class Genre

attr_reader :id
attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end


  def save
    sql = "INSERT INTO genres (type) VALUES ($1) RETURNING *"
    values = [@type]
    result = SqlRunner.run(sql, values)[0]['id']
    @id = result.to_i
  end

  def self.all
      sql = "SELECT * FROM genres"
      values = []
      result = SqlRunner.run(sql, values)
      genres = result.map{|genre| Genre.new(genre)}
      return genres
    end

    def self.delete_all()
      sql = "DELETE FROM genres"
      values = []
      SqlRunner.run(sql, values)
     end

     def delete
       sql = "DELETE FROM genres WHERE id = $1"
       values=[@id]
       SqlRunner.run(sql, values)
     end

     def update
      sql = "UPDATE genres SET (type) =
     ($1) WHERE id = $2"
     values = [@type]
     SqlRunner.run(sql, values)
    end

    def self.find(id)
     sql = "SELECT * FROM genres WHERE id = $1"
     values = [id]
     results = SqlRunner.run(sql,values)[0]
     genre = Genre.new(results)
     return genre
   end

   def find_books
      sql = "SELECT * FROM books WHERE genre_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      books_array = results.map{|book| Book.new(book)}
      return books_array
    end


end

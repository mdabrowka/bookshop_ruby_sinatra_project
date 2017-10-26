require_relative('../db/sql_runner.rb')
require_relative('author.rb')
require_relative('genre.rb')
require_relative('book.rb')

class SourceLanguage

attr_reader :id
attr_accessor :language

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @language = options['type']
  end

  def save
    sql = "INSERT INTO source_languages (language) VALUES ($1) RETURNING *"
    values = [@language]
    result = SqlRunner.run(sql, values)[0]['id']
    @id = result.to_i
  end

  def self.all
      sql = "SELECT * FROM source_languages"
      values = []
      result = SqlRunner.run(sql, values)
      languages = result.map{|language| SourceLanguage.new(language)}
      return languages
    end

    def self.delete_all()
      sql = "DELETE FROM source_languages"
      values = []
      SqlRunner.run(sql, values)
     end

     def delete
       sql = "DELETE FROM source_languages WHERE id = $1"
       values=[@id]
       SqlRunner.run(sql, values)
     end

     def update
      sql = "UPDATE source_languages SET (language) =
     ($1) WHERE id = $2"
     values = [@language]
     SqlRunner.run(sql, values)
    end

    def self.find(id)
     sql = "SELECT * FROM languages WHERE id = $1"
     values = [id]
     results = SqlRunner.run(sql,values)[0]
     language = SourceLanguage.new(results)
     return language
   end

   def find_books
      sql = "SELECT * FROM books WHERE source_language_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      books_array = results.map{|book| Book.new(book)}
      return books_array
    end


end

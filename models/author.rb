require_relative('../db/sql_runner.rb')

class Author

attr_reader :id
attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    sql = "INSERT INTO authors (first_name, last_name) VALUES ($1, $2) RETURNING *"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)[0]['id']
    @id = result.to_i
  end

  def self.all
      sql = "SELECT * FROM authors"
      values = []
      result = SqlRunner.run(sql, values)
      authors = result.map{|author| Author.new(author)}
      return authors
    end

      def full_name
        return @first_name + " " + @last_name
     end

    def find_books
       sql = "SELECT * FROM books WHERE author_id = $1"
       values = [@id]
       results = SqlRunner.run(sql, values)
       books_array = results.map{|book| Book.new(book)}
       return books_array
     end

    def self.delete_all()
      sql = "DELETE FROM authors"
      values = []
      SqlRunner.run(sql, values)
     end

     def delete
       sql = "DELETE FROM authors WHERE id = $1"
       values=[@id]
       SqlRunner.run(sql, values)
     end

     def update
      sql = "UPDATE authors SET (first_name, second_name) =
     ($1, $2 ) WHERE id = $3"
     values = [@first_name, @second_name]
     SqlRunner.run(sql, values)
    end

    def self.find(id)
     sql = "SELECT * FROM authors WHERE id = $1"
     values = [id]
     results = SqlRunner.run(sql,values)[0]
     author = Author.new(results)
     return author
   end

end

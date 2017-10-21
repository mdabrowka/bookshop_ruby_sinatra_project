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

end

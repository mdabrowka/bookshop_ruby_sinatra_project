require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/genre.rb' )


get '/welcome' do
  @books = Book.all
  erb(:low_stock)
end

get '/books' do #displays all books
  @books = Book.all
  erb(:"books/index")
end

get '/books/new' do #displays a new book form with dropdown menu of authors
  @authors = Author.all
  @genres = Genre.all
  erb(:"books/new")
end

post '/books' do #creates new book
  @book = Book.new(params)
  @book.save
  erb(:"books/create")
end

get '/books/:id' do #displays an individual book
  @book = Book.find(params[:id])
  @books = Book.all
  index = @books.find_index {|book| book.id == params[:id].to_i()}
  @idplusone = @books[(index + 1)].id
  @idminusone = @books[(index - 1)].id
  erb(:"books/show")
end

get '/books/:id/edit' do #displays a form with pre-populated book info
  @authors = Author.all
  @genres = Genre.all
  @book = Book.find(params[:id])
  erb(:"books/edit")
end

post '/books/:id' do #updates the book
  Book.new(params).update
  redirect to '/books'
end

post '/books/:id/delete' do #deletes the book
  book = Book.find(params[:id])
  book.delete()
  redirect to '/books'
end

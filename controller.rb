require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/author.rb')
require_relative('./models/book.rb')

get '/books' do #displays all books
  @books = Book.all
  erb(:index)
end

get '/books/new' do #displays a new book form with dropdown menu of authors
  @authors = Author.all
  erb(:new)
end

post '/books' do #creates new book
  @book = Book.new(params)
  @book.save
  erb(:create)
end

get '/books/new_author' do #displays a form to add new authpr
  erb(:new_author)
end

post '/books' do #creates new author
  @author = Author.new(params)
  @author.save
  erb(:author_created)
end

get '/books/:id' do #displays an individual book
  @book = Book.find(params[:id])
  erb(:show)
end

  get '/books/:id/edit' do #displays a form with pre-populated book info
    @authors = Author.all
    @book = Book.find(params[:id])
    erb(:edit)
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

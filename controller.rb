require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/author.rb')
require_relative('./models/book.rb')

get '/books' do
  @books = Book.all
  erb(:index)
end

get '/books/new' do
  @authors = Author.all
  erb(:new)
end

get '/books/new_author' do
  erb(:new_author)
end

post '/books' do
  @author = Author.new(params)
  @author.save
  erb(:author_created)
end

post '/books' do
  @book = Book.new(params)
  @book.save()
  erb(:create)
end

get '/books/:id' do
  @book = Book.find(params[:id])
  erb(:show)
end

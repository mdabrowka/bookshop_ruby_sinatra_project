require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/author.rb')
require_relative('./models/book.rb')

get '/books' do
  @books = Book.all
  erb(:index)
end

get '/books/:id' do
  @book = Book.find(params[:id])
  erb(:show)
end

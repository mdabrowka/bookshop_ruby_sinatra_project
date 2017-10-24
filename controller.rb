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

 get '/books/:id/edit' do
   @authors = Author.all
  #  @autor = Author.find(params[:id])
   @book = Book.find(params[:id])
   erb(:edit)
 end

 post '/books/:id' do
   Book.new(params).update
   redirect to '/books'
 end

post '/books/:id/delete' do
  book = Book.find(params[:id])
  book.delete()
  redirect to '/books'
end

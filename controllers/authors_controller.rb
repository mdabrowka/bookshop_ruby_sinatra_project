require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/genre.rb' )


get '/books/new_author' do #displays a form to add new authpr
  erb(:"authors/new_author")
end

post '/author' do #creates new author
  @author = Author.new(params)
  @author.save
  erb(:"authors/author_created")
end

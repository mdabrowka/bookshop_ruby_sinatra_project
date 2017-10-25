require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/genre.rb' )


get '/books/new_genre' do
  erb(:"genres/new_genre")
end

post '/genre' do #creates new genre
  @genre = Genre.new(params)
  @genre.save
  erb(:"genres/genre_created")
end

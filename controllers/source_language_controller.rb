require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/book.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/genre.rb' )
require_relative( '../models/source_language.rb' )


get '/books/new_source_language' do
  erb(:"source_languages/new_source_language")
end

post '/source_language' do #creates new source language
  @source_language = SourceLanguage.new(params)
  @source_language.save
  erb(:"source_languages/source_language_created")
end

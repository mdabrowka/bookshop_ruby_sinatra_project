require('pry')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require_relative('../models/genre.rb')
require_relative('../models/source_language.rb')


 Book.delete_all
 Author.delete_all
 Genre.delete_all
 SourceLanguage.delete_all

#Source language seeds
source_language1 = SourceLanguage.new({'language' => 'Polish'})
source_language1.save

source_language2 = SourceLanguage.new({'language' => 'Swedish'})
source_language2.save

source_language3 = SourceLanguage.new({'language' => 'Brazilian Portuguese'})
source_language3.save

source_language4 = SourceLanguage.new({'language' => 'Catalan'})
source_language4.save

source_language5 = SourceLanguage.new({'language' => 'Finnish'})
source_language5.save

source_language6 = SourceLanguage.new({'language' => 'Korean'})
source_language6.save

#Genre seeds
genre1 = Genre.new({'type' => 'novel'})
genre1.save

genre2 = Genre.new({'type' => 'autobiography'})
genre2.save

genre3 = Genre.new({'type' => 'short story'})
genre3.save

genre4 = Genre.new({'type' => 'poetry'})
genre4.save


#Authors seeds
author1 = Author.new({'first_name' => 'Clarice',
   'last_name' => 'Lispector'})
 author1.save

 author2 = Author.new({'first_name' => 'Han',
   'last_name' => 'Kang'})
 author2.save

 author3 = Author.new({'first_name' => 'Merce',
   'last_name' => 'Rodoreda'})
 author3.save

 author4 = Author.new({'first_name' => 'Wislawa',
   'last_name' => 'Szymborska'})
 author4.save

 author5 = Author.new({'first_name' => 'Tove',
   'last_name' => 'Jansson'})
 author5.save

 #Books seeds
 book1 = Book.new({
   'title' => 'Sculptor\'s Daughter',
   'author_id' => author5.id,
   'quantity' => '17',
   'genre_id' => genre2.id,
   'source_language_id' => source_language2.id,
   'buy_price' => '6',
   'sell_price' => '13',
   'cover_image' => 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1385436215i/17558603._UY200_.jpg'
   })
 book1.save

 book2 = Book.new({
   'title' => 'The Vegetarian',
   'author_id' => author2.id,
   'quantity' => '23',
   'genre_id' => genre1.id,
   'source_language_id' => source_language6.id,
   'buy_price' => '8',
   'sell_price' => '60',
   'cover_image' => 'https://thediplomat.com/wp-content/uploads/2016/07/thediplomat_2016-07-07_11-45-57.jpg'
   })
 book2.save

 book3 = Book.new({
   'title' => 'Human Acts',
   'author_id' => author2.id,
   'quantity' => '34',
   'genre_id' => genre1.id,
   'source_language_id' => source_language6.id,
   'buy_price' => '8',
   'sell_price' => '10',
   'cover_image' => 'https://static1.squarespace.com/static/5019421184ae7e81bd01bf4e/551ef206e4b0170ec8abdbe0/56bbf4f562cd94f5f8c27ae7/1455158518149/HA+8-2-16.jpeg'
   })
 book3.save

 book4 = Book.new({
   'title' => 'Enough',
   'author_id' => author4.id,
   'quantity' => '27',
   'genre_id' => genre4.id,
   'source_language_id' => source_language1.id,
   'buy_price' => '8',
   'sell_price' => '16',
   'cover_image' => 'https://images.gr-assets.com/books/1428234270l/25300957.jpg'
   })
 book4.save

 book5 = Book.new({
   'title' => 'The Hour of a Star',
   'author_id' => author1.id,
   'quantity' => '12',
   'genre_id' => genre1.id,
   'source_language_id' => source_language3.id,
   'buy_price' => '6',
   'sell_price' => '13',
   'cover_image' => 'https://www.penguin.co.uk/content/dam/catalogue/pim/editions/277/9780141392035/cover.jpg'
   })
 book5.save

 book6 = Book.new({
   'title' => 'The Selected Stories',
   'author_id' => author3.id,
   'quantity' => '5',
   'genre_id' => genre3.id,
   'source_language_id' => source_language4.id,
   'buy_price' => '9',
   'sell_price' => '13',
   'cover_image' => 'https://cdn.shopify.com/s/files/1/0282/5792/products/stories_highres.jpg?v=1384460804'
   })
 book6.save

 book7 = Book.new({
   'title' => 'Death in Spring',
   'author_id' => author3.id,
   'quantity' => '3',
   'genre_id' => genre1.id,
   'source_language_id' => source_language4.id,
   'buy_price' => '8',
   'sell_price' => '13',
   'cover_image' => 'https://images.gr-assets.com/books/1398195398l/6405181.jpg'
   })
 book7.save

 book8 = Book.new({
   'title' => 'The Complete Stories',
   'author_id' => author1.id,
   'quantity' => '9',
   'genre_id' => genre3.id,
   'source_language_id' => source_language3.id,
   'buy_price' => '8',
   'sell_price' => '16',
   'cover_image' => 'https://www.penguin.co.uk/content/dam/catalogue/pim/editions/81/9780141197388/cover.jpg'
   })
 book8.save

 book9 = Book.new({
   'title' => 'The White Book',
   'author_id' => author2.id,
   'quantity' => '14',
   'genre_id' => genre2.id,
   'source_language_id' => source_language6.id,
   'buy_price' => '8',
   'sell_price' => '10',
   'cover_image' => 'https://images-eu.ssl-images-amazon.com/images/I/31zi0ttmuDL.jpg'
   })
 book9.save


binding.pry
nil

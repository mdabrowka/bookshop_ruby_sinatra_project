require('pry')
require_relative('author.rb')
require_relative('book.rb')

Book.delete_all
Author.delete_all

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
  'genre' => 'autobiography',
  'source_language' => 'Swedish',
  'buy_price' => '6',
  'sell_price' => '13'
  })
book1.save

book2 = Book.new({
  'title' => 'The Vegetarian',
  'author_id' => author2.id,
  'quantity' => '23',
  'genre' => 'novel',
  'source_language' => 'Korean',
  'buy_price' => '8',
  'sell_price' => '15'
  })
book2.save

book3 = Book.new({
  'title' => 'Human Acts',
  'author_id' => author2.id,
  'quantity' => '34',
  'genre' => 'novel',
  'source_language' => 'Korean',
  'buy_price' => '8',
  'sell_price' => '10'
  })
book3.save

book4 = Book.new({
  'title' => 'Enough',
  'author_id' => author4.id,
  'quantity' => '27',
  'genre' => 'poetry',
  'source_language' => 'Polish',
  'buy_price' => '8',
  'sell_price' => '16'
  })
book4.save

book5 = Book.new({
  'title' => 'The Hour of a Star',
  'author_id' => author1.id,
  'quantity' => '12',
  'genre' => 'novella',
  'source_language' => 'Brazilian Portuguese',
  'buy_price' => '6',
  'sell_price' => '13'
  })
book5.save

book6 = Book.new({
  'title' => 'The Selected Stories',
  'author_id' => author3.id,
  'quantity' => '5',
  'genre' => 'short story',
  'source_language' => 'Catalan',
  'buy_price' => '9',
  'sell_price' => '13'
  })
book6.save

book7 = Book.new({
  'title' => 'Death in Spring',
  'author_id' => author3.id,
  'quantity' => '3',
  'genre' => 'novel',
  'source_language' => 'Catalan',
  'buy_price' => '8',
  'sell_price' => '13'
  })
book7.save

book8 = Book.new({
  'title' => 'The Complete Stories',
  'author_id' => author1.id,
  'quantity' => '9',
  'genre' => 'short story',
  'source_language' => 'Brazilian Portuguese',
  'buy_price' => '8',
  'sell_price' => '16'
  })
book8.save

book9 = Book.new({
  'title' => 'The White Book',
  'author_id' => author2.id,
  'quantity' => '14',
  'genre' => 'autobiography',
  'source_language' => 'Korean',
  'buy_price' => '8',
  'sell_price' => '10'
  })
book9.save


binding.pry
nil

require('pry')
require_relative('author.rb')
require_relative('book.rb')


author1 = Author.new({'first_name' => 'Clarice',
  'last_name' => 'Lispector'})
author1.save

book1 = Book.new({
  'title' => 'The Hour of a Star',
  'author_id' => author1.id,
  'genre' => 'novella',
  'source_language' => 'Portuguese',
  'buy_price' => '7',
  'sell_price' => '12'
  })
book1.save





binding.pry
nil

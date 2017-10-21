require('pry')
require_relative('author.rb')
require_relative('book.rb')

Book.delete_all
Author.delete_all


author1 = Author.new({'first_name' => 'Clarice',
  'last_name' => 'Lispector'})
author1.save

author2 = Author.new({'first_name' => 'Han',
  'last_name' => 'Kang'})
author2.save


book1 = Book.new({
  'title' => 'The Hour of a Star',
  'author_id' => author1.id,
  'genre' => 'novella',
  'source_language' => 'Portuguese',
  'buy_price' => '7',
  'sell_price' => '12'
  })
book1.save

book2 = Book.new({
  'title' => 'The Vegetarian',
  'author_id' => author2.id,
  'genre' => 'novel',
  'source_language' => 'Korean',
  'buy_price' => '8',
  'sell_price' => '15'
  })
book2.save




binding.pry
nil

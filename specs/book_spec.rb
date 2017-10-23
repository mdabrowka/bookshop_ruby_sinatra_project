require('minitest/autorun')
require_relative('../models/book.rb')


class BookTest < MiniTest::Test

  def setup
  @book1 = Book.new({
    'title' => 'Sculptor\'s Daughter',
    'author_id' => '1',
    'quantity' => '7',
    'genre' => 'autobiography',
    'source_language' => 'Swedish',
    'buy_price' => '6',
    'sell_price' => '12'
    })
  end

    def test_stock_level
      assert_equal("Medium", @book1.stock_level)
    end

    def test_markup
      assert_equal(200, @book1.markup)
    end



end

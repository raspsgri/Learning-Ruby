class Book
  attr_accessor :title, :author, :price

  def initialize(title, author, price)
    @title = title
    @author = author
    @price = price
  end

  def to_s
    "#{title} by #{author} - $#{price}"
  end
end

class BookCount
  attr_accessor :book, :count

  def initialize(book, count)
    @book = book
    @count = count
  end
end

class Bookstore
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(title, author, price, count)
    book = Book.new(title, author, price)
    book_count = BookCount.new(book, count)
    books << book_count
  end

  def list_books
    books.each_with_index do |book_count, index|
      puts "#{index + 1}. #{book_count.book} - Count: #{book_count.count}"
    end
  end

  def count_books
    total_count = books.sum { |book_count| book_count.count }
    puts "Total books: #{total_count}"
  end

  def my_method
    "Hello"
  end
end

# Example usage
bookstore = Bookstore.new

bookstore.add_book("The Great Gatsby", "F. Scott Fitzgerald", 10.99, 3)
bookstore.add_book("To Kill a Mockingbird", "Harper Lee", 9.99, 5)
bookstore.add_book("1984", "George Orwell", 12.99, 2)

bookstore.list_books
bookstore.count_books
p bookstore.my_method

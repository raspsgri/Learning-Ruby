class Book
  attr_accessor :title, :author, :price, :count

  def initialize(title, author, price, count)
    @title = title
    @author = author
    @price = price
    @count = count
  end

  def to_s
    "#{title} by #{author} - $#{price}"
  end
end

class Bookstore
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(title, author, price, count)
    book = Book.new(title, author, price, count)
    books << book
  end

  def list_books
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book}"
    end
  end

  def count_books
    total_count = books.sum { |book| book.count }
    puts "Total books: #{total_count}"
  end
end

# Example usage
bookstore = Bookstore.new

bookstore.add_book("The Great Gatsby", "F. Scott Fitzgerald", 10.99, 3)
bookstore.add_book("To Kill a Mockingbird", "Harper Lee", 9.99, 5)
bookstore.add_book("1984", "George Orwell", 12.99, 2)

bookstore.list_books
bookstore.count_books
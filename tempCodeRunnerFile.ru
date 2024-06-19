class Calculator
  def initialize
    @first_number = 0
    @second_number = 0
    @operation = ''
  end

  def get_numbers_and_operation
    puts 'Enter your first number:'
    @first_number = get_integer_input
    puts 'Enter your second number:'
    @second_number = get_integer_input
    puts 'Enter the operation (+, -, *, /):'
    @operation = get_operation_input
  end

  def get_integer_input
    begin
      Integer(gets.chomp) # Convert user input to an integer
    rescue ArgumentError
      puts 'Invalid input. Please enter a valid integer.'
      retry # Retry getting input if an invalid integer is entered
    end
  end

  def get_operation_input
    operation = gets.chomp
    unless ['+', '-', '*', '/'].include?(operation)
      puts 'Invalid input. Please enter a valid operation (+, -, *, /).'
      get_operation_input # Recursively call the method until a valid operation is entered
    end
    operation
  end

  def calculate
    case @operation
    when '+'
      @first_number + @second_number # Perform addition
    when '-'
      @first_number - @second_number # Perform subtraction
    when '*'
      @first_number * @second_number # Perform multiplication
    when '/'
      @first_number / @second_number # Perform division
    end
  end
end

calculator = Calculator.new

puts 'Welcome to the Calculator App!'
loop do
  puts '-----------------------------'
  puts 'What would you like to do?'
  puts '1. Perform a calculation'
  puts '2. Exit'
  choice = gets.chomp.to_i

  case choice
  when 1
    calculator.get_numbers_and_operation
    result = calculator.calculate
    puts "The result is: #{result}"
  when 2
    puts 'Thank you for using the Calculator App. Goodbye!'
    break
  else
    puts 'Invalid choice. Please enter a valid option.'
  end
end

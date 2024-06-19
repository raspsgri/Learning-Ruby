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
      Integer(gets.chomp)
    rescue ArgumentError
      puts 'Invalid input. Please enter a valid integer.'
      retry
    end
  end

  def get_operation_input
    operation = gets.chomp
    unless ['+', '-', '*', '/'].include?(operation)
      puts 'Invalid input. Please enter a valid operation (+, -, *, /).'
      get_operation_input
    end
    operation
  end

  def calculate
    case @operation
    when '+'
      @first_number + @second_number
    when '-'
      @first_number - @second_number
    when '*'
      @first_number * @second_number
    when '/'
      @first_number / @second_number
    end
  end
end

calculator = Calculator.new
calculator.get_numbers_and_operation
result = calculator.calculate
puts "The result is: #{result}"

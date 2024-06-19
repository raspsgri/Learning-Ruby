class Calculator
  def initialize
    @expression = ''
  end

  def get_expression
    puts 'Enter your expression:'
    @expression = gets.chomp
  end

  def calculate
    begin
      result = eval(@expression) # Evaluate the expression using eval method
      puts "The result is: #{result}"
    rescue StandardError => e
      puts "Error: #{e.message}"
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
    calculator.get_expression
    calculator.calculate
  when 2
    puts 'Thank you for using the Calculator App. Goodbye!'
    break
  else
    puts 'Invalid choice. Please enter a valid option.'
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

def add(*input_numbers)
  return 0 if input_numbers.empty?

  input_numbers = handle_different_delimiters(input_numbers)
  if input_numbers.include?(",\n")
    return "Invalid Input Format: Comma followed by a new line."
  end

  numbers_array = input_numbers.gsub("\n", ",").split(',').map(&:to_i)
  negative_numbers = numbers_array.select { |num| num < 0 }
  if negative_numbers.any?
    raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}"
  end

  numbers_array.sum
end

def handle_different_delimiters(input_numbers)
  updated_input_numbers = []
  input_numbers.each do |input_number|
    if input_number.start_with?("//")
      delimiter_end_index = input_number.index("\n")
      delimiter = input_number[2..delimiter_end_index - 1]
      updated_input_numbers << input_number[delimiter_end_index + 1..-1].gsub(delimiter, ",")
    else
      updated_input_numbers << input_number
    end
  end
  updated_input_numbers.join(',')
end

# Basic Test Case
numbers = add('')
numbers = add('1')
numbers = add('1,5')

# Any amount of numbers test case
add('1,5,5', '6,7,4', '2,1')

# Handle new lines between numbers
add("1\n2,3")
add("1,\n")

# Support different delimiters
add("//;\n1;2")

# With negative numbers Test Case
begin
  add("//;\n-41;2")
rescue ArgumentError => e
  e.message
end

def add(*input_numbers)
  return 0 if input_numbers.empty?

  input_numbers = input_numbers.join(',') if input_numbers.is_a?(Array)
  if input_numbers.include?(",\n")
    return "Invalid Input Format: Comma followed by a new line."
  end
  input_numbers.gsub("\n", ",").split(',').map(&:to_i).sum
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

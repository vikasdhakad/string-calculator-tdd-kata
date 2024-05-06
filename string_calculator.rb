def add(input_numbers)
  return 0 if input_numbers.empty?

  input_numbers.split(',').map(&:to_i).sum
end

# Basic Test Case 
numbers = add('')
numbers = add('1')
numbers = add('1,5')

def ask_number
  puts "Please input a number."
  @number = gets.chomp.to_i
  sleep 1
  puts "Testing if Kaprekar number..."
  puts
  sleep 1
end

def convert_to_array(value)
  value.to_s.split("")
end

def add_at(k)
  sq_array = convert_to_array(@squared_number)

  first_array = sq_array.take(k)
  last_array = sq_array.drop(k)

  @a = first_array.inject(:+)
  @b = last_array.inject(:+)
  c = @a.to_i + @b.to_i
  return c
end

def kaprekar_1
  num_array = convert_to_array(@number)
  k = num_array.length
  add_at(k)
end

def kaprekar_2
  num_array = convert_to_array(@number)
  k = num_array.length - 1
  add_at(k)
end

def start_query
  ask_number
  @squared_number = @number ** 2

  case
  when @number == kaprekar_1
    say_success
  when @number == kaprekar_2
    say_success
  else
    puts "#{@number} is not a Kaprekar number."
  end
end

def say_success
  puts "You selected #{@number}."
  puts "#{@number} squared is #{@squared_number}."
  puts "#{@a} + #{@b} = #{@number}"
  puts "Therefore, #{@number} is a Kaprekar number."
end

start_query

puts "Enter a number: "
input = gets.chomp.to_i
number = input % 10

def ordinal(number)
  last_digit = number % 10
  if number.between?(11, 13)
    return "th"
  end  

    if last_digit == 1
    return "st"
    
    elsif last_digit == 2
    return "nd"
    
    elsif last_digit == 3
    return "rd"
    
    else 
    return "th"
    
    end
  end


 
puts "#{input}#{ordinal(input)}"

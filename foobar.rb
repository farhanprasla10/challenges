puts "How many items do you want to see?"
num = gets.to_i

num.times do |a|
    a += 1 
    b = a % 3
    c = a % 5
    if b == 0 && c == 0
      print "foobar "
    elsif b == 0
      print "foo "
    elsif c == 0
      print "bar "
    else
      print "#{a} "
    end
 end



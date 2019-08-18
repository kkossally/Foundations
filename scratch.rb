# nums = [1,2,3,4,5,6,7,8,9,10]
# nums_2 = [2,4,6,8,10]

# def all_numbers_even?(nums)
#     nums.all? { |num| num.even? }
# end

# p [1,2,3,4,5,6].count { |e| e.even? }
# p [1,3,5].count { |e| e.even? }

# sym = :hello
# str = "hello"

# p sym.object_id
# sym = :HELLO
# p sym.object_id
# p str.object_id
# str = "HELLO"
# p str.object_id

# p "Enter your name:"
# name = gets
# p "Hello " + name

# p "Enter your name:"
# name = gets.chomp
# p "Hello " + name

# p "Enter a number:"
# num = gets.chomp
# p num * 2

# p "Enter a number:"
# num = gets.chomp.to_i
# p 2 * num

# puts "Hello world."
# print "Hello world,"
# print " my name is Sir.\n"
# p "Hello world."

# identity = {name:"kafkaf", age:"27", location:"NYC"}
# p identity[:name]
# p identity[:age]

# prime = Proc.new do |num|

#     if num < 2
#         false
#     elsif (2...num).any? { |i| num % i == 0 }
#         false
#     else
#         true
#     end

# end

# p prime.call(2)
# p prime.call(4)
# p prime.call(5)
# p prime.call(11)

# def add_and_proc(num1, num2, proc)
#     proc.call(num1 + num2)
# end

# p add_and_proc(1, 2, prime)
# p add_and_proc(5, 3, prime)

# p [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(&prime)
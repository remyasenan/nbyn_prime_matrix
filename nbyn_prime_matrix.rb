class Nbyntable
	
	def initialize(num)
		@num = num
	end
	
	def prime?(number)
		(2...number).each do |divisor|
			return false if number % divisor == 0
		end	
		true		
	end
	
	def find_n_prime_numbers(num)
		prime_array = []
		(2...1000).each do |i|
			prime_array << i if prime?(i)
			break if prime_array.length >= num
		end
		prime_array
	end
	
	def print_table(num)
		prime_array = find_n_prime_numbers(num)
		(1..num).each do |i|
			(1..num).each do |j|
				output = prime_array[i-1].to_i + prime_array[j-1].to_i 
				puts output.to_s + "\t"
			end
			puts "\n"
		end
		
	end
	
end


puts "Please enter the number: "

number = gets.chomp.to_i

puts "\n----------Output---------\n"


obj = Nbyntable.new(number)

puts obj.print_table(number)
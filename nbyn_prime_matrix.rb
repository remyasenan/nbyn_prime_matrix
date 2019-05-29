require "rspec/autorun"

class Nbyntable
	
  def initialize(num)
    @num = num
  end
	
  def self.prime?(number)
    (2...number).each do |divisor|
      return false if number % divisor == 0
    end	
    true		
  end
	
  def self.find_n_prime_numbers(num)
    prime_array = []
    (2...1000).each do |i|
      prime_array << i if Nbyntable.prime?(i)
        break if prime_array.length >= num
      end
      prime_array
  end
  
   def self.find_n_fibonacci_numbers(num)
    fibonacci_array = [1,1]
    (1...1000).each do |i|
      fibonacci_array << fibonacci_array[i] + fibonacci_array[i-1]
        break if fibonacci_array.length >= num
      end
      fibonacci_array
  end
	
  def self.print_table(w,h,type,action)
    num = w > h ? w : h
    if (type == 'p')
      result_array = Nbyntable.find_n_prime_numbers(num)
    elsif (type == 'f')
      result_array = Nbyntable.find_n_fibonacci_numbers(num)
    else
      puts "Unexpected input!"	    
    end    
    (1..h).each do |i|
      (1..w).each do |j|
	if action == '+'      
          output = result_array[i-1].to_i + result_array[j-1].to_i 
	elsif action == '*'
	  output = result_array[i-1].to_i * result_array[j-1].to_i 
	else
	  puts "Unexpected Input!"
	end   
	puts output.to_s + "\t"
      end
      puts "\n"
    end		
  end	
  end

describe Nbyntable, ".prime" do
  it "returns true if prime" do
    expect(Nbyntable.prime?(2)).to be true
    expect(Nbyntable.prime?(4)).to be false
    expect(Nbyntable.prime?(19)).to be true
    expect(Nbyntable.prime?(67)).to be true
    expect(Nbyntable.prime?(107)).to be true
    expect(Nbyntable.prime?(108)).to be false
    expect(Nbyntable.prime?(109)).to be true
  end
end

describe Nbyntable, ".find_n_prime_numbers" do
  it "checks if it returns an array" do
    expect(Nbyntable.find_n_prime_numbers(2)).to be_an_instance_of(Array)
  end
  it "return first n prime numbers array" do
    expect(Nbyntable.find_n_prime_numbers(10)).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end 
end

describe Nbyntable, ".find_n_fibonacci_numbers" do
  it "checks if it returns an array" do
    expect(Nbyntable.find_n_fibonacci_numbers(2)).to be_an_instance_of(Array)
  end
  it "return first n fibanocci numbers array" do
    expect(Nbyntable.find_n_fibonacci_numbers(10)).to match_array([1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
  end 
end

puts "Please give matrix dimension (<width>x<height>) :"

dimension = gets
w = dimension.split("x")[0].to_i
h = dimension.split("x")[1].to_i

puts "Should I use (P)rime numbers or (F)ibonacci numbers?"

prime_or_fib = gets.chomp

puts "Multiplication (*) or Addition (+)"

multiply_or_add = gets.chomp

puts "\n----------Output---------\n"

puts Nbyntable.print_table(w,h,prime_or_fib,multiply_or_add)



require 'faker'
require 'colorize'

def currency_calculator(input_currencies, target)
	
	def currency_hash(input_currencies, target) #helper method returns a hash of denominations with values
		hash = {}
        key = ""
        dictatorship = Faker::Restaurant.name
        print "The current military dictatorship goes by the name #{dictatorship}\n".light_green
        
        print "If you need to make a $#{target} purchase\n".light_green
        print "#{dictatorship} is regulating each of the following currency units as equivalents to your total your purchase ammount:\n".light_green
    
        input_currencies.split(",").each do |element|
			if element == element.to_f.to_s || element == element.to_i.to_s
				hash[key] = element.to_f
			else
				key = element
			end
        end
        hash.each{|k,v| print "#{k}(s): #{v.to_i}  "}
        print "\n"
        print "You won't any type of 'change' back,\n".light_green
        print "and given how precious these resources are, you want to avoid over paying.\n".light_green
		hash.sort_by {|key, value| -value}.to_h 
	end

	#backtracking recursion helper method that assigns possible currency combinations into an array of arrays
	def find_combinations(results, progressive_combination_array, denominations, target, idx=0)
		if target == 0
				results.push(progressive_combination_array.clone)
		else
			idx.upto(denominations.length-1) do |index|
				denomination = denominations[index]
				next if target - denomination < 0
				target -= denomination
				progressive_combination_array.push(denomination)
				find_combinations(results, progressive_combination_array, denominations, target, index)
				target += denomination
				progressive_combination_array.pop
			end
		end	
	end

	def print_combinations(results, denominations, names_array) #print format helper method
        
        header_column_widths = Hash[names_array.each_with_index.map { |name, i| [i+1, name.length] }]
        print "The following currency combinations can be made to create the exact amount of your purchase total:\n".red
		print "#{names_array.join(" ")} \n".light_blue
		counter = 1
		results.each do |array|										
			combination_array = []
			denominations.each {|denomination| combination_array << array.count(denomination)}
			combination_array.each do|number| 		#Time Complexity of O(n^2), might improve that time cost with a hashtable
				print "#{number} ".prepend(" " * (header_column_widths[counter]-number.to_s.length)).light_green
				counter == names_array.length ? counter = 1 : counter +=1
			end
			print "\n"
		end
		print "\n"
		print "\n"
		puts "Possible Ways to Pay for Your Purchase: #{results.length}".red
    end
    
    def empty_message
        print "Unfortunately, there are no combinations of this currency that add up perfectly to your purchase total\n".red
        print "\n"
        print "Please wait for the next regime change and try again with their authorized currency\n".red
    end

	#establish method parameters
	denominations_hash = currency_hash(input_currencies, target)
	denominations = denominations_hash.values.map{|num| target / num}
	names_array = denominations_hash.keys
	results = []
	
    find_combinations(results, [], denominations, target) #call recursion helper
    results.length === 0 ? empty_message : print_combinations(results, denominations, names_array) #call print helper
    results
end
def currency_maker
    arr = ""
            rand(3..5).times do
        arr << Faker::Appliance.equipment.delete(" ")+","
        arr << rand(1..26).to_s+","
    end
    arr
end


currency_calculator(currency_maker, rand(500..751))
def currency_calculator(input_currencies, target)
	
	def currency_hash(input_currencies) #helper method returns a hash of denominations with values
		hash = {}
		key = ""
		input_currencies.split(",").each do |element|
			if element == element.to_f.to_s || element == element.to_i.to_s
				hash[key] = element.to_f
			else
				key = element
			end
		end
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
		print "#{names_array.join(" ")} \n"
		counter = 1
		results.each do |array|										
			combination_array = []
			denominations.each {|denomination| combination_array << array.count(denomination)}
			combination_array.each do|number| 		#Time Complexity of O(n^2), might improve that time cost with a hashtable
				print "#{number} ".prepend(" " * (header_column_widths[counter]-number.to_s.length))
				counter == names_array.length ? counter = 1 : counter +=1
			end
			print "\n"
		end
		print "\n"
		print "\n"
		puts "Count: #{results.length}"
	end

	#establish method parameters
	denominations_hash = currency_hash(input_currencies)
	denominations = denominations_hash.values.map{|num| target / num}
	names_array = denominations_hash.keys
	results = []
	find_combinations(results, [], denominations, target) #call recursion helper
	print_combinations(results, denominations, names_array) #call print helper
	results
end

input_currencies = "Arrowhead,3,Coin,1.5,Button,150"
#input_currencies = "Quarter,4,Dime,10,Nickel,20,Penny,100"
#input_currencies = "Arrowhead,3,Coin,1.5,Button,150,Shell,25"
#target = 100
target = 150

currency_calculator(input_currencies, target)
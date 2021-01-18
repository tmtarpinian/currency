def currency
	denominations  = [25,10,5,1]
	target = 100
	results = []

#backtracking recursion method that assigns possible currency combinations into an array of arrays
	def find_combinations(results, progressive_combination_array, denominations, target, idx=0)
		if target == 0
				results.push(progressive_combination_array.clone)
		else
			idx.upto(denominations.length-1) do |i|
				denomination = denominations[i]
				next if target - denomination < 0
				target -= denomination
				progressive_combination_array.push(denomination)
				find_combinations(results, progressive_combination_array, denominations, target, i)
				target += denomination
				progressive_combination_array.pop
			end
		end
	end

	def print_combinations(results, denominations)
		names_array = ["Quarter", "Dime", "Nickel", "Penny"]
		header_column_widths = Hash[names_array.each_with_index.map { |e, i| [i+1, e.length] }]
		print "#{names_array.join(" ")} \n"
		print "\n"
		counter = 1
		results.each do |array|										#Time Complexity of O(n^2)
			combination_array = []
			denominations.each {|denomination| combination_array << array.count(denomination)}
			combination_array.each do|number| 
				print "#{number} ".prepend(" " * (header_column_widths[counter]-number.to_s.length))
				counter == names_array.length ? counter = 1 : counter +=1
			end
			print "\n"
		end
		print "\n"
		print "\n"
		puts "Count: #{results.length}"
	end
	find_combinations(results, [], denominations, target)
	print_combinations(results, denominations)
	results
end

currency
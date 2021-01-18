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
		print "Quarter Dime Nickel Penny\n"
		print "\n"
		spacer_cycle = "A"
		results.each do |array|										#Time Complexity of O(n^2)
			combination_array = []
			denominations.each {|denomination| combination_array << array.count(denomination)}
			combination_array.each do|number| 
				case spacer_cycle
					when "A"
						print "#{number}".prepend(" " * 6)
						spacer_cycle = "B"
					when "B"
						if number.to_s.length == 1
						print "#{number}".prepend(" " * 4)
						else
							print "#{number}".prepend(" " * 3)
						end
						spacer_cycle = "C"
					when "C"
						if number.to_s.length == 1
							print "#{number}".prepend(" " * 6)
						else
							print "#{number}".prepend(" " * 5)
						end
						spacer_cycle = "D"
					when "D"
						if number.to_s.length == 1
							print "#{number}".prepend(" " * 5)
						elsif number.to_s.length == 2
							print "#{number}".prepend(" " * 4)
						else
							print "#{number}".prepend(" " * 3)
						end
						spacer_cycle = "A"
				end
			end
			print "\n"
		end
		print "\n"
		print "\n"
		puts "Count: #{results.length}"
	end

		find_combinations(results, [], denominations, target)
		print_combinations(results, denominations)
end

currency
require "spec_helper"
require "./lib/bonus"

describe "#currency_calculator" do

	it "calculates the correct number of currency combinations" do
		input_currencies_one = "Arrowhead,3,Coin,1.5,Button,150"
		input_currencies_two = "Arrowhead,3,Coin,1.5,Button,150,Shell,25"
		input_currencies_three = "Quarter,4,Dime,10,Nickel,20,Penny,100"
		input_currencies_four = "Arrowhead,7,Coin,31,Button,57"
		target_one = 150  
		target_two = 100  
		target_three = 2
		result_one = currency_calculator(input_currencies_one, target_one)
		expect(result_one.length).to eq(6)
		result_two = currency_calculator(input_currencies_two, target_one)
		expect(result_two.length).to eq(63)
		result_three = currency_calculator(input_currencies_three, target_two)
		expect(result_three.length).to eq(242)
		result_four = currency_calculator(input_currencies_four, target_three)
		expect(result_four.length).to eq(0)
	end
end
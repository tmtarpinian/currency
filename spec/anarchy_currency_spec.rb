require "spec_helper"
require "./lib/anarchy_currency"

describe "currency_calculator" do

	it "calculates the correct number of currency combinations" do
		input_currencies_one = "Arrowhead,3,Coin,1.5,Button,150"
		input_currencies_two = "Arrowhead,3,Coin,1.5,Button,150,Shell,25"
		input_currencies_three = "Quarter,4,Dime,10,Nickel,20,Penny,100"
		target = 150    
		target_two = 100
		result_one = currency_calculator(input_currencies_one, target)
		expect(result_one.length).to eq(6)
		result_two = currency_calculator(input_currencies_two, target)
		expect(result_two.length).to eq(63)
		result_three = currency_calculator(input_currencies_three, target_two)
		expect(result_three.length).to eq(242)
	end
end
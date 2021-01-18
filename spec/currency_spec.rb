require "spec_helper"
require "./currency"

describe "currency" do
	it "calculates the correct number of currency combinations" do
		results = currency
		expect(results.length).to eq(242)
	end
end
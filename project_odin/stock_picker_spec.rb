# stock_picker Unit Test
# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
require_relative "stock_picker"
describe "the stock picker" do
  it "works with basic input" do
    expect(stock_picker([1,2])).to eq([0,1])
    expect(stock_picker([1,2,4])).to eq([0,2])
    expect(stock_picker([1,5,2])).to eq([0,1])
  end
  it "doesn't sell before it buys" do
    expect(stock_picker([2,10,1])).to eq([0,1])
  end
  it "works with complex input" do
    expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
  end
end
# Walk through the array, tracking minimum price and profit
# We can't sell before we buy, so max possible profit at each day is today's price - historic minimum

def stock_picker(stock_prices)
  min_price = [10000,0] # min price, day it occurred
  max_profit = [0,0,0]  # max profit, buy day, sell day
  stock_prices.each_with_index do |current_price,today|
    if current_price < min_price[0]
      min_price = [current_price,today]
    end
    if max_profit[0] < current_price - min_price[0]
      max_profit = [current_price - min_price[0], min_price[1], today]
    end
  end
  max_profit[1..2]  # we only want buy day, sell day
end
# Question
Implement a method "stock_picker" that takes in an array of stock prices, one for each hypothetical day. 
It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

Example:
stock_picker([17,3,6,9,15,8,6,1,10])
[1,4]  # for a profit of $15 - $3 == $12

# my potential workflow
get all possible buy day and sell day values as an array
compare the differences of each value array and pick the highest one
For the highest value array, get the indexes

# My first solution attempt
def stock_picker(stock_prices)
  result = []
  potential_arr = []
  biggest = -1
  stock_prices.each_with_index do |stock_price, buying_day_index|
    potential_best_selling_day_price = stock_prices[buying_day_index..-1].max
    potential_arr.push([stock_price, potential_best_selling_day_price])
  end
  potential_arr.each_with_index do |array_of_values, index|   
    new_difference = (array_of_values[1] - array_of_values[0]) 
    if new_difference > biggest
      biggest = new_difference 
      result = [stock_prices.index(array_of_values[0]), stock_prices.index(array_of_values[1])]
    end
  end
  pp result
end

stock_picker([17,3,6,9,15,8,6,16,1,20])
# => [8, 9]

# Final solution

# given an array of prices on consecutive days, finds the best days to buy and sell
# returns [b, s] where b is the best buy date index and s is the best sell date index
# returns [] if there is no way to make a profit during any of the days
# e.g. returns [1,4] in the example below because 15 - 3 is the maximum profit available

# workflow reads something like: 
# Raise the first item in stocks up, then make a temp array from the raised item to the end. 
# loop through the temp array and compare each item in it to the raised item
# if any of the item in temp array is greater than the raised item, we've got a possible selling day, get its index

def stock_picker(stocks)
  profit = 0
  best_days = []
  stocks.each_with_index do |price1, index1|
    stocks[index1..-1].each_with_index do |price2, index2|
      if price2 - price1 > profit
        profit = price2 - price1
        best_days[0] = index1 #index of price1 in the stocks array
        best_days[1] = index1 + index2 #index of price2 in the stocks array. its amazing how it is index1 + index2
      end
    end
  end
  p best_days
end

stock_picker([17,3,6,9,15,8,6,1,10])

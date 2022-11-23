
def stock_picker(prices)
  min_price = Float::INFINITY
  min_day = 0

  max_start = -1
  max_end = -1
  max_profit = 0

  prices.each_with_index do |price, idx|
    if price < min_price
      min_price = price
      min_day = idx
    end

    if price - min_price > max_profit
      max_profit = price - min_price
      max_start = min_day
      max_end = idx
    end
  end

  [max_start, max_end]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([4,3,2,1])
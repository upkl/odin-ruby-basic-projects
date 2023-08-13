def stock_picker prices
  buy_dates = (0...prices.length).select{ |d| d == 0 or (d < prices.length - 1 and prices[d - 1] > prices[d] and prices[d] <= prices[d + 1]) }
  sell_dates = (0...prices.length).select{ |d| d == prices.length - 1 or (prices.length > 0 and prices[d - 1] <= prices[d] and prices[d] > prices[d + 1]) }
  best = -1
  result = nil
  buy_dates.each do |b|
    sell_dates.each do |s|
      if s > b and prices[s] - prices[b] > best
        result = b, s
        best = prices[s] - prices[b]
      end
    end
  end
  result
end

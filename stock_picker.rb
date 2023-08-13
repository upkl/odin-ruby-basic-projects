# frozen_string_literal: true

def get_buy_dates(prices)
  (0...prices.length).select do |d|
    d.zero? or (d < prices.length - 1 and prices[d - 1] > prices[d] and prices[d] <= prices[d + 1])
  end
end

def get_sell_dates(prices)
  (0...prices.length).select do |d|
    d == prices.length - 1 or (!prices.length.empty? and prices[d - 1] <= prices[d] and prices[d] > prices[d + 1])
  end
end

def stock_picker(prices)
  buy_dates = get_buy_dates(prices)
  sell_dates = get_sell_dates(prices)

  best = -1
  result = nil
  buy_dates.each do |b|
    sell_dates.each do |s|
      if s > b && prices[s] - prices[b] > best
        result = b, s
        best = prices[s] - prices[b]
      end
    end
  end
  result
end

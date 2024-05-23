// 121. Best Time to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock

import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var minPrice = prices[0]
        var maxProfit = 0

        for price in prices {
            if price < minPrice {
                minPrice = price
            } else {
                maxProfit = max(maxProfit, price - minPrice)
            }
        }

        return maxProfit
    }
}

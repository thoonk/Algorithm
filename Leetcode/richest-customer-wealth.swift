// 1672. Richest Customer Wealth / https://leetcode.com/problems/richest-customer-wealth/

import Foundation

func maximumWealth(_ accounts: [[Int]]) -> Int {
    var result = 0
    accounts.forEach {
        result = max(result, $0.reduce(0, +))
    }

    return result
}

print(maximumWealth([[1,5],[7,3],[3,5]])) // 10

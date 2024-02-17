// 1523. Count Odd Numbers in an Interval Range / https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/

import Foundation

func countOdds(_ low: Int, _ high: Int) -> Int {
    return (high - low) / 2 + (low % 2 == 0 && high % 2 == 0 ? 0 : 1)
}

print(countOdds(3, 7)) // 3

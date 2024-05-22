// 118. Pascal's Triangle
// https://leetcode.com/problems/pascals-triangle/

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var dp = [[Int]]()
        dp.append([1])

        for i in 1..<numRows {
            var rows = [Int]()
            for j in 0..<i+1 {
                if j == 0 || j == i {
                    rows.append(1)
                } else {
                    rows.append(dp[i-1][j-1] + dp[i-1][j])
                }
            }
            dp.append(rows)
        }
        
        return dp
    }
}

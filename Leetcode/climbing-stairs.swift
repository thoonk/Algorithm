// 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/

import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = [Int](repeating: -1, count: n + 1)

        dp[0] = 1
        for i in 1..<n+1 {
            dp[i] = dp[i - 1]
            if i >= 2 {
                dp[i] += dp[i-2]
            }
        }
        
        return dp[n]
    }
}

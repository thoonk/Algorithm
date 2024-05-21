// 69. Sqrt(x)
// https://leetcode.com/problems/sqrtx

import Foundation

class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }

        var left = 1, right = x
        
        while left <= right {
            let mid = (left + right) / 2
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return right
    }
}

print(Solution().merge(&[1,2,3,0,0,0], 3, [2,5,6], 3) // [1,2,2,3,5,6]


// 3038. Maximum Number of Operations With the Same Score I
// https://leetcode.com/problems/maximum-number-of-operations-with-the-same-score-i/

import Foundation

class Solution {
    func maxOperations(_ nums: [Int]) -> Int {
        var result = 0
        var i = 0
        var common = nums[0] + nums[1]
        print(nums)
        while i+1 < nums.count {
            if common == nums[i] + nums[i+1] {
                result += 1
                i += 2
            } else {
                break
            }
        }

        return result
    }
}

print(Solution().maxOperations([3,2,1,4,5])) // 2

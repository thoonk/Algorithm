// 2760. Longest Even Odd Subarray With Threshold
// https://leetcode.com/problems/longest-even-odd-subarray-with-threshold/

import Foundation

class Solution {
    func longestAlternatingSubarray(_ nums: [Int], _ threshold: Int) -> Int {
        var result = 0

        for left in 0..<nums.count {
            if nums[left] % 2 == 0 && nums[left] <= threshold {
                var right = left

                while right + 1 < nums.count &&
                    nums[right+1] <= threshold &&
                    nums[right].isMultiple(of: 2) != nums[right+1].isMultiple(of: 2) {
                        right += 1
                }

                result = max(result, right - left + 1)
            }
        }

        return result
    }
}

print(Solution().longestAlternatingSubarray([3,2,5,4], 5)) // 3

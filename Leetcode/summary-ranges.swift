// 228. Summary Ranges
// https://leetcode.com/problems/summary-ranges/

import Foundation

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var result = [String]()
        var index = 0

        while index < nums.count {
            let start = index
            
            while index < nums.count - 1, nums[index + 1] == nums[index] + 1 {
                index += 1
            }

            let temp = index == start ?
            "\(nums[start])" :
            "\(nums[start])->\(nums[index])"
            
            result.append(temp)
            index += 1
        }

        return result
    }
}

// 704. Binary Search
// https://leetcode.com/problems/binary-search/

import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1

        while start <= end {
            let mid = (start + end) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }

        return -1
    }
}

print(Solution().search([-1,0,3,5,9,12], 9))) // 4

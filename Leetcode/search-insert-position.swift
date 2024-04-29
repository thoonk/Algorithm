// 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position/

import Foundation

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums
        return nums.binarySearch(target)
    }
}

extension Array where Element == Int {
    mutating func binarySearch(_ target: Int) -> Int {
        var start = 0
        var end = count - 1
        while start <= end {
            let mid = (start + end) / 2
            if self[mid] == target {
                return mid
            } else if self[mid] > target {
                end = mid - 1
            } else if self[mid] < target {
                start = mid + 1
            }
        }

        return start
    }
}

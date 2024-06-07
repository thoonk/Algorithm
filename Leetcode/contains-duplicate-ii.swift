// 219. Contains Duplicate II
// https://leetcode.com/problems/contains-duplicate-ii

import Foundation

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let prev = dict[num],
                abs(i - prev) <= k {
                     return true
                }

            dict[num] = i
        }

        return false
    }
}

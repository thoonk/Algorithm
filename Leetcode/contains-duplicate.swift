// 217. Contains Duplicate
// https://leetcode.com/problems/contains-duplicate

import Foundation

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var count = [Int: Int]()
        for num in nums {
            count[num, default: 0] += 1
        }

        return count.values.filter { $0 > 1 }.count > 0
    }
}
print(Solution().containsDuplicate([1,2,3,1])) // true

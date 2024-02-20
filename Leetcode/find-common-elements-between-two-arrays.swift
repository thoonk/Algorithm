// 2956. Find Common Elements Between Two Arrays
// https://leetcode.com/problems/find-common-elements-between-two-arrays

import Foundation

class Solution {
    func findIntersectionValues(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var count1 = 0, count2 = 0

        for num in nums1 where nums2.contains(num) {
            count1 += 1
        }

        for num in nums2 where nums1.contains(num) {
            count2 += 1
        }
        
        return [count1, count2]
    }
}

print(Solution().findIntersectionValues([4,3,2,3,1], [2,2,5,2,3,6])) // [3, 4]

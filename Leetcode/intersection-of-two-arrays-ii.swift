// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii

import Foundation

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1.sorted()
        var nums2 = nums2.sorted()
        var result = [Int]()
        var i = 0
        var j = 0

        while i < nums1.count && j < nums2.count {
            if nums1[i] < nums2[j] {
                i += 1
            } else if nums1[i] > nums2[j] {
                j += 1
            } else {
                result.append(nums1[i])
                i += 1
                j += 1
            }
        }

        return result
    }
}

print(Solution().intersect([1,2,2,1], [2,2])) // [2,2]

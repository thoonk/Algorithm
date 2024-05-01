// 349. Intersection of Two Arrays
// https://leetcode.com/problems/intersection-of-two-arrays/

import Foundation

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(nums2))
    }
}

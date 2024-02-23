// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i/

import Foundation

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int]()
        var greaterDic = [Int: Int]()

        for num in nums2 {
            while let last = stack.last, num > last {
                greaterDic[last] = num
                stack.removeLast()
            }
            
            stack.append(num)
        }

        return nums1.map { greaterDic[$0] ?? -1 }
    }
}

print(Solution().nextGreaterElement([4,1,2], [1,3,4,2]))

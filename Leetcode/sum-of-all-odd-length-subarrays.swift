// 1588. Sum of All Odd Length Subarrays
// https://leetcode.com/problems/sum-of-all-odd-length-subarrays/

import Foundation

class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var result = 0

        for i in 0..<arr.count {
            for j in i..<arr.count {
                if (j - i + 1).isMultiple(of: 2) == false {
                    print(arr[i...j])
                    result += arr[i...j].reduce(0, +)
                }
            }
        }

        return result
    }
}

print(Solution().sumOddLengthSubarrays([1,4,2,5,3])) // 58

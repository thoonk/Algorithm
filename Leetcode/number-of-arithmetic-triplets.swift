// 2367. Number of Arithmetic Triplets
// https://leetcode.com/problems/number-of-arithmetic-triplets/

import Foundation

class Solution {
    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        var result = 0

        nums.forEach {
            if nums.contains($0 + diff) && nums.contains($0 + 2 * diff) {
                result += 1
            }
        }

        return result
    }
    
    func arithmeticTriplets2(_ nums: [Int], _ diff: Int) -> Int {
        var result = 0

        for i in 0..<nums.count - 2 {
            for j in (i+1)..<nums.count - 1 {
                for k in (i+2)..<nums.count {
                    if nums[j] - nums[i] == diff &&
                    nums[k] - nums[j] == diff {
                        result += 1
                    }
                }
            }
        }

        return result
    }
}

print(Solution().arithmeticTriplets([0,1,4,6,7,10], 3)) // 2
print(Solution().arithmeticTriplets2([0,1,4,6,7,10], 3)) // 2

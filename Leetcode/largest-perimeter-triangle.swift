// 976. Largest Perimeter Triangle
// https://leetcode.com/problems/largest-perimeter-triangle/

import Foundation

func largestPerimeter(_ nums: [Int]) -> Int {
    let nums = nums.sorted(by: >)
    for i in 0..<nums.count-2 {
        if nums[i] < nums[i+1] + nums[i+2] {
            return nums[i] + nums[i+1] + nums[i+2]
        }
    }

    return 0
}
print(arraySign([2,1,2])) // 5
